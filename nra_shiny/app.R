# Simple Shiny app example for Gov 1005

library(shiny)
library(tidyverse)

ui <- navbarPage(
  "NRA Conventions and Hospital Admissions",
  tabPanel("Plot",
           fluidPage(
             titlePanel("Model Title"),
             sidebarLayout(sidebarPanel(selectInput(
               "plot",
               "Type of Plot",
               c("Combined Data" = "combined", "Separate Year-by-Date Combinations" = "separate")
             )),
             mainPanel(conditionalPanel('input.plot=="combined"', plotOutput("combined_plot")),
                       conditionalPanel('input.plot=="separate"', plotOutput("separate_plot"))))
           )),
  tabPanel("Story"),
  tabPanel("About",
           includeMarkdown("about.md"))
)


server <- function(input, output, session) {
  output$combined_plot <- renderPlot({
    validate(need(input$plot=="combined", message=FALSE))
    read_rds("combined.rds")
  })
  output$separate_plot <- renderPlot({
    validate(need(input$plot=="separate", message=FALSE))
    read_rds("separate.rds")
  })
}


shinyApp(ui = ui, server = server)
