# Simple Shiny app example for Gov 1005

library(shiny)

ui <- navbarPage("NRA Conventions and Hospital Admissions",
                 tabPanel("Plot",
                          downloadLink("downloadData", "Download")),
                 tabPanel("Story"),
                 tabPanel("About")
                )


server <- function(input, output, session) {
  
  # output$downloadData <- downloadHandler(
  #   filename = "nra.pdf")
  
}


shinyApp(ui = ui, server = server)
