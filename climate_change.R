library(tidyverse)
library(dplyr)
library(ggplot2)

#adding the data set
urlfile <- "https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv"
co2_data <- read.csv(url(urlfile))

#looking at unique countries
countries <- data.frame(unique(co2_data$country))

#changing country row to character
co2_data$country <- as.character(co2_data$country)

#not countries in country, these are either continents,groups of countries and etc. 
not_countries <-  c("Asia (excl. China and India)", "Asia", "Central African Republic", 
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

#looking at the different co2 causes in north america over the years
us_co2 <- co2_country %>%
  filter(country == "United States") %>%
  select(year, cement_co2, coal_co2, gas_co2,
         flaring_co2, oil_co2, other_industry_co2)

us_co2 <- us_co2 %>% replace(is.na(.), 0)

## looking at the amount of emissions caused in the latest year
most_us <- co2_country %>%
  filter(country == "United States") %>%
  filter(year == max(year)) %>%
  select(cement_co2, coal_co2, gas_co2,
         flaring_co2, oil_co2, other_industry_co2)

#wide to long most_us
long_us <- data_long <- gather(most_us, emission_type, million_tonnes, factor_key=TRUE) 

#pie chart of long_us
us_pie <- ggplot(long_us, aes(x = "",y=million_tonnes, fill=emission_type)) +
                    geom_bar(stat = "identity", width=1) +
                    coord_polar("y", start=0)

# only looking at the top 3 emissions, they had a siginificant gap beweet these top 3 and the rest. 
us_line <- ggplot(us_co2, aes(x = year, y = oil_co2, col = "blue")) + geom_line() +
  geom_line(aes(y = coal_co2, col = "red")) +
  geom_line(aes(y = gas_co2, col = "green")) +
  xlab("Year") + ylab("Amount measured in million tonnes") +
  scale_color_manual(name = "Legend", values = c("blue", "red", "green"), 
                     labels = c("oil", "coal", "gas")) 

# is it different for the world?
world_co2 <- co2_data %>% 
  filter(country == 'World') %>%
  select(year,cement_co2, coal_co2, gas_co2,
         flaring_co2, oil_co2, other_industry_co2)

# replace NA with 0 
world_co2 <- world_co2 %>% replace(is.na(.), 0)

#most in the world
most_world <- world_co2 %>%
  filter(year == max(year)) %>%
  select(cement_co2, coal_co2, gas_co2,
         flaring_co2, oil_co2, other_industry_co2)

#long most_world
long_world <- data_long <- gather(most_world, emission_type, million_tonnes, factor_key=TRUE) 

#pie chart of long_world
world_pie <- ggplot(long_world, aes(x = "",y=million_tonnes, fill=emission_type)) +
  geom_bar(stat = "identity", width=1) +
  coord_polar("y", start=0)

#line chart of world_co2
world_line <- ggplot(world_co2, aes(x = year, y = oil_co2, col = "blue")) + geom_line() +
  geom_line(aes(y = coal_co2, col = "red")) +
  geom_line(aes(y = gas_co2, col = "green")) +
  xlab("Year") + ylab("Amount measured in million tonnes") +
  scale_color_manual(name = "Legend", values = c("blue", "red", "green"), 
                     labels = c("oil", "coal", "gas")) 

# looking at amount of coal in the latest year per country
country_coal <- co2_country %>%
  filter(year == max(year)) %>%
  select(year, country, coal_co2) %>%
  arrange(desc(coal_co2)) %>%
  top_n(10)

# bar graph of country_coal
coal_bar <- ggplot(country_coal, aes(y = coal_co2, x = reorder(country,coal_co2,desc))) +
  geom_bar(stat="identity", color='black',fill='gray') +
  xlab("Country") + ylab("Amount measured in million tonnes") 


# looking at amount of oil in the latest year per country
country_oil <- co2_country %>%
  filter(year == max(year)) %>%
  select(year, country, oil_co2) %>%
  arrange(desc(oil_co2)) %>%
  top_n(10)

#bar graph of country_oil 
oil_bar <- ggplot(country_oil, aes(y=oil_co2, x = reorder(country, oil_co2, desc))) +
  geom_bar(stat="identity", color='black',fill='gray') +
  xlab("Country") + ylab("Amount measured in million tonnes") 

# looking at amount of gas in the latest year per country
country_gas <- co2_country %>%
  filter(year == max(year)) %>%
  select(year, country, gas_co2) %>%
  arrange(desc(gas_co2)) %>% 
  top_n(10)

#bar graph of country_gas
gas_bar <- ggplot(data = country_gas, aes(y = gas_co2, x = reorder(country, gas_co2, desc))) +
  geom_bar(stat = "identity", color = "black", fill = "gray") +
  xlab("Country") + ylab("Amount measured in million tonnes")






