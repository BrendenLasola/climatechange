#libraries
library(dplyr)
library(stringr)

#adding the data set
urlfile <- "https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv"
co2_data <- read.csv(url(urlfile))

#looking at unique countries
countries <- data.frame(unique(co2_data$country))

#not countries in country, these are either continents,groups of countries and etc. 
not_countries <-  c("Asia (excl. China & India)", "Asia", "Central African Republic", 
                      "Europe (excl. EU-27)", "Europe (excl. EU-28)", 
                      "European Union (27)", "European Union (28)", 
                      "French Equatorial Africa", "French Guiana", "French Polynesia", 
                      "French West Africa", "High-income countries", 
                      "International transport", "Kuwaiti Oil Fires", 
                      "Low-income countries", "Lower-middle-income countries", 
                      "North America", "North America (excl. USA)", "Oceania", 
                      "Panama Canal Zone", "Reunion", "South America", 
                      "Upper-middle-income countries", "World", "Africa", 
                      "Antartica", "Europe")

#filtering not countries in countries
co2_country <- co2_data %>%
  filter(!(country %in% not_countries))

#looking at the different co2 causes in north america for the max year(2020)
na_co2 <- co2_data %>%
  filter(year == max(year)) %>%
  filter(country == "United States") %>%
  select(country, cement_co2, coal_co2, gas_co2,
         flaring_co2, oil_co2, other_industry_co2)

#most oil in the latest year
most_oil<- co2_country %>%
  filter(year == max(year)) %>%
  filter(oil_co2 == max(oil_co2, na.rm = TRUE)) %>%
  select(country, oil_co2)

#most coal in the latest year
most_coal <- co2_country %>% 
  filter(year == max(year)) %>%
  filter(coal_co2 == max(coal_co2, na.rm = TRUE))%>%
  select(country, coal_co2)

#most gas in the latest year
most_gas <- co2_country %>% 
  filter(year == max(year)) %>%
  filter(gas_co2 == max(gas_co2, na.rm = TRUE))%>%
  select(country, gas_co2)

#most flaring in the latest year
most_flaring <- co2_country %>% 
  filter(year == max(year)) %>%
  filter(flaring_co2 == max(flaring_co2, na.rm = TRUE))%>%
  select(country, flaring_co2)

#most_other in the latest year
most_other <- co2_country %>% 
  filter(year == max(year)) %>%
  filter(other_industry_co2 == max(other_industry_co2, na.rm = TRUE))%>%
  select(country, other_industry_co2)

#most cement in the latest year
most_cement <- co2_country %>% 
  filter(year == max(year)) %>%
  filter(cement_co2 == max(cement_co2, na.rm = TRUE))%>%
  select(country, cement_co2)

#most coal in us and what year
na_coal <- co2_country %>%
  filter(country == "United States") %>%
  filter(coal_co2 == max(coal_co2, na.rm = TRUE)) %>%
  select(year, coal_co2)

#most gas in us and what year
na_gas <- co2_country %>%
  filter(country == "United States") %>%
  filter(gas_co2 == max(gas_co2, na.rm = TRUE)) %>%
  select(year, gas_co2)

#most oil in us and what year
na_oil <- co2_country %>%
  filter(country == "United States") %>%
  filter(oil_co2 == max(oil_co2, na.rm = TRUE)) %>%
  select(year, oil_co2)


