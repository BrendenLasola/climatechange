library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

#reading the data
co2_data <- read.csv(url(urlfile))

#sourcing for shiny
source("A4_ui.R")
source("A4_server.R")
source("A4_analysis.R")

#initiating shiny
shinyApp(ui, server)

