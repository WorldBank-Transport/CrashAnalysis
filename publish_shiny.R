## This Rscript deploys the Shiny Application

# Set your working directory to the shiny application directory
#CHANGE THIS IF NECESSARY
setwd("~/Documents/World_Bank/crash_project/CrashAnalysis/manila_crash_visuals")

# Load required packages
require(shiny)
require(rsconnect)

# deploy the application
deployApp()
