
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
<<<<<<< HEAD
#' @import dplyr
#' @import tidyr
#' @import tibble
=======
#' @import tidyverse
>>>>>>> c3374361c1c946dead164d5e4f9d841bcdd897bc
#'
#'
epanet_read_cv <- function(hmodel, hreport, cv_name) {

  ID <- Node1 <- Node2 <- Diameter <- Type <- MinorLoss <- NULL
  Pressure <- Timestamp <- Headloss <- Flow <- Velocity <- p1 <- p2 <- NULL

  # Read  from the hmodel the parameter of the control valve to evaluate.
  cvalve <- hmodel$Valves |> filter(ID == cv_name) |>
    dplyr::select(ID, Node1, Node2, Diameter, Type, MinorLoss)

  # Values for the Nodes of the Valve
  nodes <- hreport$nodeResults |>
<<<<<<< HEAD
    dplyr::filter(ID %in% c(cvalve$Node1[1], cvalve$Node2[1])) |>
    dplyr::select(ID, Pressure, Timestamp) |>
    tidyr::pivot_wider(names_from = ID, values_from = Pressure)
=======
    filter(ID %in% c(cvalve$Node1[1], cvalve$Node2[1])) |>
    select(ID, Pressure, Timestamp) |>
    pivot_wider(names_from = ID, values_from = Pressure)
>>>>>>> c3374361c1c946dead164d5e4f9d841bcdd897bc

  names(nodes) <- c("Timestamp", "p1", "p2")

  # Values for the Valve (Link))
  links <- tibble::as_tibble( hreport$linkResults) |>
    dplyr::filter(ID == cv_name) |>
    dplyr::select(Timestamp, Headloss, Flow, Velocity)

  operation_data <- nodes |>
    dplyr::full_join(links, by ="Timestamp") |>
    dplyr::mutate(
      ID = cvalve$ID,
      Diameter = cvalve$Diameter,
      Type = cvalve$Type,
      MinorLoss = cvalve$MinorLoss
    ) |>
    dplyr::select(Timestamp,
           ID, Diameter, Type, MinorLoss,
           p1, p2, Headloss, Flow, Velocity)

  return(operation_data)

}
