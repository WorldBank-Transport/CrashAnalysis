# CrashAnalysis
Alejandro and Anna (A&amp;A) initiative to analyze Manila crash data

README

This repository contains relevant code and data for our initiative to visualize and analyze DRIVER car accident data for Manila, Philippines. It is essential collaborators read this, as well as the text lines at the head of most R scripts, in order to understand workflows and not make inadequate modifications to code. What follows is a discussion of the files in the CrashAnalysis repository.

*** NO LONGER RELEVANT FILES (in most cases, do ignore):

data_agg.R
aggregated_data.csv

*** Historical Files (no longer used but important in the formation of our current dataset):

modify_data.R - this file contains a few lines of code used to process the raw data and extract relevant variables. Refer to it if future processing is required but a new file would likely be more beneficial to handle future raw data.

*** Relevant files:

test_data.csv - this is the data currently being used for the shiny application. Note it is not the most recent data available in DRIVER and we are working to link the most recent DRIVER data.

test_application.R - this script is used for testing the Shiny application. All intended modifications to the application should first be tested on this file. For publishing, use the files in the manila_crash_visuals folder.

publish_shiny.R - use this script to deploy the application once changes to the server.R and ui.R files in the manila_crash_visuals folder have been finalized.

manila_crash_visuals - directory for the shiny application; contains:
--> server.R : code for the server of the Shiny Application
--> ui.R : code for the UI of the Shiny Application
--> test_data.csv : a copy of the data used in the application
--> rsconnect : a directory generated after first deployment of the application; makes future deployments quicker
