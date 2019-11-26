# Simple Shiny app example for Gov 1005

library(shiny)

# I still need to add the contents for these panels, but not today.

ui <- navbarPage("NRA Conventions and Hospital Admissions",
                 tabPanel("Plot"),
                 tabPanel("Story"),
                 tabPanel("About"))


server <- function(input, output, session) {}


shinyApp(ui = ui, server = server)
