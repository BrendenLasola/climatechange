library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

co2_data <- read.csv("owid-co2-data.csv")

source("A4_ui.R")
source("A4_server.R")
source("A4_analyis.R")


shinyApp(ui, server)
