# TEST Shiny App File
# this file is intended for testing - you can test changes in the 
# ui & server of the Shiny application before moving them to the real
# application's ui.R and server.R files

# INPUTS
# input_file: the path to the data file with crash data
# manila_lat: latitude coordinate for Manila, Philippines
# manila_lng: longitude coordinate for Manila, Philippines
# map_zoom: initial zoom for the map 

input_file = "~/Documents/World_Bank/crash_project/CrashAnalysis/test_data.csv"
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

# Make Shiny application
# Start by making ui for Shiny Application
# refer to Shiny R documentation for further information on this
ui <- fluidPage(sliderInput(inputId = "time_of_day", 
                            label = "Time of Day", 
                            min = 0, max = 24, value = c(7,12)),
                tags$div(title = "Weekday Input",
                         selectInput(inputId = "weekday", 
                                     label = "Weekday", 
                                     choices = c('Monday', 'Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'))),
                leafletOutput("MapPlot1"))
# Implement server for shiny application
# Refer to Shiny R documentation for further information on this
server <- function(input, output){
  
  # Reactive expression for the data subsetted to what the user selected
  filteredData <- reactive({
    myData[myData$time_of_day%in%input$time_of_day[1]:input$time_of_day[2] & myData$weekday %in% input$weekday,]
  })
  
  # Expression for aspects for leaflet map not changed by user input
  # includes source data, initial view, and referrence to OpenStreetMaps
  output$MapPlot1 <- renderLeaflet(leaflet(myData) %>% setView(lat = manila_lat, lng = manila_lng, zoom = map_zoom) %>% addTiles())
  
  # obtain new markers from user input using leafletProxy
  observe({
    leafletProxy('MapPlot1', data = filteredData()) %>% clearMarkers() %>% 
      clearMarkerClusters() %>% addMarkers(clusterOptions = markerClusterOptions())
  })
}

# This command turns the script into a Shiny Application
# comment this out to run individual part of the script
shinyApp(ui, server)

