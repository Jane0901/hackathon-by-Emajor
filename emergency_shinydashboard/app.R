#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(flexdashboard)
library(shiny)
library(RCurl)
library(tidyverse)
library(ggplot2) 
library(bbplot)
library(shinyjs)
library(shinythemes)
library(DT)
load("activity.RData")
load("restaurant.RData")
load("emergency.RData")


ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
    selectInput("CountryInput", "Country(國家)",
                choices = c("China", 
                            "Japan", 
                            "Hong Kong",
                            "Macao",
                            "Korea",
                            "America",
                            "Singapore"),
                selected = "Singapore")
  ),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(tableOutput("table1"))
      
      # box(
      #   title = "Controls",
      #   sliderInput("slider", "Number of observations:", 1, 100, 50)
      )
    )
  )


server <- function(input, output) {
  
  
  "中國(China)" -> "China"
  "日本(Japan)"  -> "Japan"
  "香港(Hong Kong)" -> "Hong Kong"
  "澳門(Macao)" -> "Macao"
  "韓國(Korea)" -> "Korea"
  "美國(America)" -> "America"
  "新加坡(Singapore)" -> "Singapore"
  
  output$table1 <-  renderTable({
    
      filtered <-
        emergency_contact %>%
        filter(
          Country == input$CountryInput)
      filtered
    })
}

shinyApp(ui, server)