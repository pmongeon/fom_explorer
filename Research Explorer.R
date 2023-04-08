library(shiny)
library(DT)
library(tidyverse)
library(RPostgres)

#dbDisconnect(db)
#db<-dbConnect(Postgres(),
 #             user = read.csv("admin/db_connection.csv")$user,
#              password = read.csv("admin/db_connection.csv")$pw,
#              host = read.csv("admin/db_connection.csv")$host,
#              port = read.csv("admin/db_connection.csv")$port,
#              dbname = read.csv("admin/db_connection.csv")$dbname)

# fom_data<-dbReadTable(db, "scopus_works")

# This will read the first sheet of the Excel file


ui <- fluidPage(
  titlePanel("Faculty of Management Research Explorer"),
  tabsetPanel(
    tabPanel("Dataset",
    sidebarLayout(
      sidebarPanel("Some filters"),
      mainPanel(
        tabsetPanel(
          tabPanel("Methods"),
          tabPanel("Papers"),
          tabPanel("People"))
      ))
  ),    
  tabPanel("Bibliometric dashboard", 
             sidebarLayout(
               sidebarPanel(
                 selectInput("school", "Select Schools", c("SIM","RSB","SRES","SPA"), multiple =  T),
                 selectInput("cluster", "Select clusters", c("1","2","3","4","5","6"), multiple =  T),
                 selectInput("topics", "Select topics", c("Forest","Info","Ocean","Blabla"), multiple =  T),
               ),
               mainPanel(
                 tabsetPanel(
                   tabPanel("Papers"),
                   tabPanel("People"),
                   tabPanel("Dashboard"),
                   tabPanel("Networks"),
                   tabPanel("Wordclouds"))
                ))
    ),
    tabPanel("Clusters", 
             sidebarLayout(
               sidebarPanel("Some filters"),
               mainPanel(
                 tabsetPanel(
                   tabPanel("Methods"),
                   tabPanel("Overview"))
               ))
    ),    
    tabPanel("Topics", 
             sidebarLayout(
               sidebarPanel("Some filters"),
               mainPanel(
                 tabsetPanel(
                   tabPanel("Methods"),
                   tabPanel("Overview")
                   )
               )
             )
            )    
    )
  )


server <- function(input, output) {
  }

shinyApp(ui, server)
