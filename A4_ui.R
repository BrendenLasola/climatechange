library(dplyr)
library(shiny)
library(ggplot2)

co2_data <- read.csv(url(urlfile))

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

