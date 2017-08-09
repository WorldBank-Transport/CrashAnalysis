# Generate data visual 

# INPUTS
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

# Map of Manila 
m <- leaflet(myData) %>% setView(lat = manila_lat, lng = manila_lng, zoom = map_zoom)
# cluster crashes by location
m <- m %>% addTiles() %>% addMarkers(clusterOptions = markerClusterOptions())

# Make Shiny application
ui <- fluidPage(sliderInput(inputId = "time_of_day", 
                            label = "Time of Day", 
                            min = 0, max = 24, value = c(7,12)),
                tags$div(title = "Weekday Input",
                         selectInput(inputId = "weekday", 
                                     label = "Weekday", 
                                     choices = c('Monday', 'Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'))),
                leafletOutput("MapPlot1"))
server <- function(input, output){
  output$MapPlot1 <- renderLeaflet(leaflet(myData[myData$time_of_day%in%input$time_of_day[1]:input$time_of_day[2] & myData$weekday %in% input$weekday,]) %>% setView(lat = manila_lat, lng = manila_lng, zoom = map_zoom) %>% addTiles() %>% addMarkers(clusterOptions = markerClusterOptions()))
}

# Run this command to show the App
shinyApp(ui, server)

# test
# m 
# sliderInput('time_of_day','time of day',0,24,c(0,24))
