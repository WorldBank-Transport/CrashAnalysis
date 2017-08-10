## This Rscript deploys the Shiny Application
# BEFORE RUNNING THIS SCRIPT:
# Make sure you've configured the project's shinyapps.io account to your R
# follow instructions on this webpage - https://shiny.rstudio.com/articles/shinyapps.html
# email: crash_analytics_wb@yahoo.com
# password: cr4sh4n4lytics
# account: cr4sh4n4lytics

# INPUT
# wd: a string containing the directory which contains the Shiny Application's
# server.R and ui.R files
wd <- "~/Documents/World_Bank/crash_project/CrashAnalysis/manila_crash_visuals"

# Set your working directory to the shiny application directory
setwd(wd)

# Load required packages
require(shiny)
require(rsconnect)

# deploy the application
deployApp()
