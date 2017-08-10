#
# This is the server logic of our Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# IMPORTANT: Test modifications in the test_application.R file before passing
# to this file

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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  # Reactive expression for the data subsetted to what the user selected
  filteredData <- reactive({
    myData[myData$time_of_day%in%input$time_of_day[1]:input$time_of_day[2] & myData$weekday %in% input$weekday,]
  })
  
  output$MapPlot1 <- renderLeaflet(leaflet(myData) %>% setView(lat = manila_lat, lng = manila_lng, zoom = map_zoom) %>% addTiles())
  
  # obtain new markers from user input
  observe({
    leafletProxy('MapPlot1', data = filteredData()) %>% clearMarkers() %>% 
      clearMarkerClusters() %>% addMarkers(clusterOptions = markerClusterOptions())
  })

  
})
