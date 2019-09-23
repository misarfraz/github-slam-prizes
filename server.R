library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)

prizes <- read.csv(file = "./tennis_pay.csv")

shinyServer(function(input, output){
  output$prizeHist <- renderPlot({
    prizes %>%
      filter(grand_slam == input$slam & grand_slam_gender == input$gender) %>%
      ggplot(aes(x = year, y = prize)) +
      geom_col(fill = "lightblue") +
      xlab("Year")+
      ylab("Prize Money")
  })
})