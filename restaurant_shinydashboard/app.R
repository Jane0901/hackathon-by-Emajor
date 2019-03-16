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
library()
# load("./activity.RData")
# load("./emergency.RData")
load("./restaurant.RData")
load("./restaurant2.RData")
load("./restaurant3.RData")

#the restaurant


# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(disable = T),
  dashboardSidebar(disable = T),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    selectInput("CityInput", "City where you are",
                choices = c("Taipei City",
                            "New Taipei City", 
                            "Taoyuan City",
                            "Taichung City",
                            "Tainan City",
                            "Kaohsiung City",
                            "Keelung City",
                            "Hsinchu County",
                            "Chiayi City",
                            "Keelung City",
                            "Miaoli County",
                            "Changhua County",
                            "Nantou County",
                            "Yunlin County",
                            "Chiayi County",
                            "Pingtung County",
                            "Yilan County",
                            "Hualien County",
                            "Taitung County",
                            "Penghu County",
                            "Lienchiang County",
                            "Kinmen County"),
                selected = "Taipei City"),
    selectInput("FoodInput", "Food Preference",
                choices = c("Muslin",
                            "vegetarian"), 
                selected = "vegetarian",
                multiple = T),
    fluidRow(
      # box(plotOutput("plot1"), title = "location", status = "warning"),
      box(tableOutput("tablevege"), title = "Vegetarian",
          status = "warning", width = 6, collapsible = T),
      box(tableOutput("tableMuslin"), title = "Muslin",
          status = "warning", width = 6, collapsible = T)
      
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  
   # output$plot1 <- renderPlot({
   #   MuslinRestTaiwan %>% filter(City == input$CityInput) %>%
   #     select(經度坐標,緯度坐標) -> filtered
   #   
   #   
   #   
   # 
   # })
   
   output$tablevege <-  renderTable({
     #畫素食者
     # View(vegeEnglish)
     vegeEnglish %>% filter(City == input$CityInput) %>%
                     select(客戶名稱1, 電話, 地址,消費價格) -> filtered
     filtered
   })
   
   output$tableMuslin <-  renderTable({
     MuslinRestTaiwan %>% filter(City == input$CityInput) %>%
       select(餐廳名稱,英文地址) -> filtered
     filtered
   })
   
   
}

# Run the application 
shinyApp(ui = ui, server = server)

