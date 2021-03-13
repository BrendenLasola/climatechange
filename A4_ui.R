library(dplyr)
library(shiny)
library(ggplot2)

co2_data <- read.csv("owid-co2-data.csv")


#5 relevant values of interest.
# Data

na_co2 <- co2_data %>%
  filter(year == max(year)) %>%
  filter(country == "United States") %>%
  select(country, cement_co2, coal_co2, gas_co2,
         flaring_co2, oil_co2, other_industry_co2)

most_oil<- co2_data %>%
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(country != "International transport") %>%
  filter(oil_co2 == max(oil_co2, na.rm = TRUE)) %>%
  select(country, oil_co2)

most_coal <- co2_data %>% 
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(country != "International transport") %>%
  filter(coal_co2 == max(coal_co2, na.rm = TRUE))%>%
  select(country, coal_co2)

most_gas <- co2_data %>% 
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(country != "International transport") %>%
  filter(gas_co2 == max(gas_co2, na.rm = TRUE))%>%
  select(country, gas_co2)

most_flaring <- co2_data %>% 
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(country != "International transport") %>%
  filter(flaring_co2 == max(flaring_co2, na.rm = TRUE))%>%
  select(country, flaring_co2)

most_flaring <- co2_data %>% 
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(country != "International transport") %>%
  filter(flaring_co2 == max(flaring_co2, na.rm = TRUE))%>%
  select(country, flaring_co2)

most_other <- co2_data %>% 
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(country != "International transport") %>%
  filter(other_industry_co2 == max(other_industry_co2, na.rm = TRUE))%>%
  select(country, other_industry_co2)

most_cement <- co2_data %>% 
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(country != "International transport") %>%
  filter(cement_co2 == max(cement_co2, na.rm = TRUE))%>%
  select(country, cement_co2)


