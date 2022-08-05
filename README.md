---
editor_options: 
  markdown: 
    wrap: 72
---

<!-- README.md is generated from README.Rmd. Please edit that file -->

# epanettools4cv

`epanettools4cv` is an R package for reading the data and simulating
control valves in Epanet’s .inp and .rpt formats into R.

The goal of epanettools4cv is to …

## Installation

You can install the development version of epanettools4cv like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Package units

All data are stored in the following SI (International System) units:

-   Length in meter
    ![(m)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;(m) "(m)")
-   Diameter in millimeter
    ![(mm)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;(mm) "(mm)")
-   Water pressure in meter
    ![(m](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;(m "(m")
    this assumes a fluid density of ![1.000
    (kg/m^3)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;1.000%20(kg%252Fm%5E3) "1.000 (kg/m^3)"))
-   Elevation in meter
    ![(m)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;(m) "(m)")
-   Time in seconds
    ![s](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;s "s")
-   Concentration in
    ![kg/m^3](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;kg%252Fm%5E3 "kg/m^3")
-   Flow in
    ![L/s](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;L%252Fs "L/s")
-   Demand in
    ![L/s](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;L%252Fs "L/s")
-   Velocity in
    ![m/s](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m%252Fs "m/s")
-   Acceleration
    ![g](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;g "g")
    (![g = 9.81
    m/s^2](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;g%20%253D%209.81%20m%252Fs%5E2 "g = 9.81 m/s^2"))
-   Energy in
    ![kW-hour](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;kW-hour "kW-hour")
-   Power in
    ![kW](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;kW "kW")
-   Volume in
    ![m^3](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m%5E3 "m^3")

## EPANET unit conventions

| **Parameter**               | **US customary units**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | **SI-based units**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|-------------|--------------------------------|---------------------------|
| Concentration               | ![mass/L](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mass%252FL "mass/L") where ![mass](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mass "mass") can be defined as ![mg](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mg "mg") or ![ug](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ug "ug")                                                                                                                                                                                                                                                                                                         | ![mass /L](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mass%20%252FL "mass /L") where ![mass](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mass "mass") can be defined as ![mg](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mg "mg") or ![ug](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ug "ug")                                                                                                                                                                                                     |
| Demand                      | Same as *flow*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Same as *flow*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Diameter (Pipes)            | ![in](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;in "in")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | ![mm](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mm "mm")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Diameter (Tanks)            | ![ft](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ft "ft")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | ![m](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m "m")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Efficiency (Pumps)          | percent ![\\%](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5C%25 "%")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | percent ![\\%](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5C%25 "%")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Elevation                   | ![ft](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ft "ft")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | ![m](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m "m")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Emitter coefficient         | ![flow / sqrt(psi)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;flow%20%252F%20sqrt(psi) "flow / sqrt(psi)")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | ![flow / sqrt(m)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;flow%20%252F%20sqrt(m) "flow / sqrt(m)")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Energy                      | ![kW-hours](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;kW-hours "kW-hours")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | ![kW-hours](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;kW-hours "kW-hours")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Flow                        | \- CFS: ![ft^3/s](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ft%5E3%252Fs "ft^3/s") <br/>- GPM: ![gal/min](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;gal%252Fmin "gal/min") <br/> - MGD: ![million gal/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;million%20gal%252Fday "million gal/day") <br/> - IMGD: ![million imperial gal/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;million%20imperial%20gal%252Fday "million imperial gal/day") <br/> - AFD: ![acre-feet/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;acre-feet%252Fday "acre-feet/day") | \- LPS: ![L/s](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;L%252Fs "L/s") <br/> - LPM: ![L/min](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;L%252Fmin "L/min") <br/> - MLD: ![million L/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;million%20L%252Fday "million L/day") <br/> - CMH: ![m^3/hr](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m%5E3%252Fhr "m^3/hr") <br/> - CMD: ![m^3/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m%5E3%252Fday "m^3/day") |
| Friction factor             | unitless                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | unitless                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Hydraulic head              | ![ft](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ft "ft")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | ![m](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m "m")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Length                      | ![ft](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ft "ft")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | ![m](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m "m")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Minor loss coefficient      | unitless                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | unitless                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Power                       | ![horsepower](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;horsepower "horsepower")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | ![kW](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;kW "kW")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Pressure                    | ![psi](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;psi "psi")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | ![m](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m "m")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Reaction coefficient (Bulk) | 1/day (1st-order)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | 1/day (1st-order)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Reaction coefficient (Wall) | \- mass ![/ft/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%252Fft%252Fday "/ft/day") (0-order) <br/> - ![ft/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ft%252Fday "ft/day") (1st-order))                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | \- mass ![/mt/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%252Fmt%252Fday "/mt/day") (0-order) <br/> - ![m/day](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m%252Fday "m/day") (1st-order))                                                                                                                                                                                                                                                                                                                                                                        |
| Roughness coefficient       | \- ![10^{-3}](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;10%5E%7B-3%7D "10^{-3}") ft (Darcy-Weisbach) <br/> - unitless (otherwise)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | \- millimeter (Darcy-Weisbach) <br/> - unitless (otherwise)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Source mass injection rate  | ![mass/min](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mass%252Fmin "mass/min")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | ![mass/min](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;mass%252Fmin "mass/min")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Velocity                    | ![ft/s](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ft%252Fs "ft/s")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | ![m/s](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m%252Fs "m/s")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Volume                      | ![ft^3](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;ft%5E3 "ft^3")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | ![m^3](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;m%5E3 "m^3")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Water age                   | hours                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | hours                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |

# Control valves samples

## GPV Curves

Generally, every control valve has a specific curve that describes the
relationship between valve opening and the corresponding headloss
coefficient (in general, this curve can be provided by the valve
supplier).

By analyzing the measured data of flow passing the valve at the
corresponding valve openings, you can create a flow to valve opening
curve which can be transformed into the flow to headloss curve using the
provided headloss to valve opening curve. You can do that in a
calculation table or adjust your software to make the post-processing
before creating the .inp-file.
