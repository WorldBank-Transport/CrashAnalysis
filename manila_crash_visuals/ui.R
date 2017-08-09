#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# INPUTS
input_file = "test_data.csv"
manila_lat = 14.5995
manila_lng = 120.9842
map_zoom = 13

# Required Packages
require(shiny)
require(leaflet)
require(readr)

# load data
myData <- read_csv(input_file)
myData$time_of_day <- as.integer(myData$time_of_day)

# Define UI for application 
shinyUI(fluidPage(
  
  sliderInput(inputId = "time_of_day", 
              label = "Time of Day", 
              min = 0, max = 24, value = c(7,12)),
  tags$div(title = "Weekday Input",
           selectInput(inputId = "weekday", 
                       label = "Weekday", 
                       choices = c('Monday', 'Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'))),
  leafletOutput("MapPlot1"))
)
