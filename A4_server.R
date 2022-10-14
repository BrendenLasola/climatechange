co2_data <- read.csv(url(urlfile))

server <- function(input,output) {
  
  output$plot_data <- renderPlot({
    
    colnames(na_co2_data) <- c("Year", "Cement CO2", "Coal CO2", "Gas CO2", "Oil CO2", "Flaring CO2",
                               "Other Industry CO2")
    
    co2_plot <- ggplot(na_co2_data) + 
      geom_line(aes(x = `Year` , y = na_co2_data[[input$emmission_type]]), 
                col = input$color_var, size =  2) +
      labs(title = "Types of Emmision", x = "Year", y = input$emmission_type)
    
    co2_plot
  })
}
