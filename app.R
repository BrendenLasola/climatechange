#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(dplyr)

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

#looking at the different co2 causes in north america over the years
na_co2 <- co2_data %>%
  filter(country == "United States") %>%
  select(year, cement_co2, coal_co2, gas_co2,
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

page_one <-   page_one <- tabPanel(
  "How C02 is being emmited into the air.",
  mainPanel(
    p("Introduction"),
    p("Climate change can be an overwhelming topic in general because of the scope of the problem itself. Dealing with climate change as an individual
        might seem daunting because what can a person really do against climate change? This interactive guide app will hopefully show the benefits of 
        being mindful of climate change and persuade you to actively try to fight climate change in any way possible. 
        
        The way's that C02 is mainly distributed in the atmosphere are through the production of cement, gas, oil, and coal, the flaring of gas and
        other industrial processes. These are the 6 pieces of data that will be explored in this app. Looking at all of these methods of emmission, Asia has the
        most emmitted the most in 2019 for every single method except other industrial processes. Asia lead with 11046 million tonnes of CO2 emmitted from the production of coal.Asia is a bigger region in general compared to others, population
        in places like China and India is extremely high.
        
        Now looking at North America specifically, 2019 has recorded 2342 million tonnes of CO2 emmited from the production of oil. This is the largest amount of emmited
        CO2 recorded from the production of oil in North America. This isn't even it's peak, North America reached a peak of 3263 million tonnes of emmited CO2 in
        2005. Oil and Gas are the main culprits of CO2 emmission in north america today while Coal used to be the primary suspect. Even with the rise of gas and oil in the recent 
        years, the production of gas had it's all time high in 2005 with 2381 million tonnes of emmitted CO2. The app itself will look at North America's history
        with resources such as coal, oil, and gas. ")
  )
)


page_two <- tabPanel(
  "CO2 Scatter Plot",
  sidebarLayout(
    sidebarPanel(
      h3("Choose the method CO2 is being emmited."),
      selectInput(
        inputId = "emmission_type",
        label = "Way's CO2 is being emmited.",
        choices = c("Cement CO2", "Coal CO2", "Gas CO2", "Oil CO2", "Flaring CO2",
                    "Other Industry CO2")),
    ),
    selectInput(
      inputId = "color_var",
      label = "Color of Points",
      choices = c("darkgray", "blue", "red", "orange",
                  "green", "brown", "purple")
    )
  ),
  ### Main panel displays the scatterplot
  mainPanel(
    h3("CO2 and North America"),
    plotOutput(outputId = "plot_data"),
    p("This chart focuses on the different ways CO2 is being emmited into the atmosphere through the lens of the USA.
      C02 is a primary greenhouse gas and is directly responsible to the earth's rapid shift in climate. When looking at the chart's, the most surprising
      discovery I found was the fall of coal and the rise of oil and gas. Early on in the USA coal was a primary fuel for general machinery, but with the rise
      of crude oil, it eventually was overtaken by oil and gas. The truth of the matter is even though the USA as a whole switched away from coal, burning
      of oil and gas is still a primary method of emitting green house gases.")
  )
)

ui <- navbarPage(
  "CO2 Data Analysis",
  page_one, page_two
)


#creating the plot
server <- function(input,output) {
  
  output$plot_data <- renderPlot({
    
    colnames(na_co2) <- c("Year", "Cement CO2", "Coal CO2", "Gas CO2", "Oil CO2", "Flaring CO2",
                          "Other Industry CO2")
    
    co2_plot <- ggplot(na_co2) + 
      geom_line(aes(x = `Year` , y = na_co2[[input$emmission_type]]), 
                col = input$color_var, size =  1.5) +
      labs(title = "Types of Emmision", x = "Year", y = input$emmission_type)
    
    co2_plot
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
