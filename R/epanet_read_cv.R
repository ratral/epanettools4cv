
#' Read Control Valves values and results
#'
#' @description  Read the operation data for the Control Valve
#' The data is extracted from the output report produced from a simulation.
#'
#' @param hmodel object with entries for sections of the EPANET .inp file.
#' @param hreport object with entries for nodes and links of the EPANET .rpt file.
#' @param cv_name Name of the Control Valve
#'
#' @return The table operation_data
#' @export
#'
#' @import tidyverse
#'
#'
epanet_read_cv <- function(hmodel, hreport, cv_name) {

  ID <- Node1 <- Node2 <- Diameter <- Type <- MinorLoss <- NULL
  Pressure <- Timestamp <- Headloss <- Flow <- Velocity <- p1 <- p2 <- NULL

  # Read  from the hmodel the parameter of the control valve to evaluate.
  cvalve <- hmodel$Valves |> filter(ID == cv_name) |>
    select(ID, Node1, Node2, Diameter, Type, MinorLoss)

  # Values for the Nodes of the Valve
  nodes <- hreport$nodeResults |>
    filter(ID %in% c(cvalve$Node1[1], cvalve$Node2[1])) |>
    select(ID, Pressure, Timestamp) |>
    pivot_wider(names_from = ID, values_from = Pressure)

  names(nodes) <- c("Timestamp", "p1", "p2")

  # Values for the Valve (Link))
  links <- as_tibble( hreport$linkResults) |>
    filter(ID == cv_name) |>
    select(Timestamp, Headloss, Flow, Velocity)

  operation_data <- nodes |>
    full_join(links, by ="Timestamp") |>
    mutate(
      ID = cvalve$ID,
      Diameter = cvalve$Diameter,
      Type = cvalve$Type,
      MinorLoss = cvalve$MinorLoss
    ) |>
    select(Timestamp,
           ID, Diameter, Type, MinorLoss,
           p1, p2, Headloss, Flow, Velocity)

  return(operation_data)

}
