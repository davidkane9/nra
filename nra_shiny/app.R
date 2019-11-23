# Simple Shiny app example for Gov 1005

library(shiny)

ui <- navbarPage("App Title",
                 tabPanel("Plot"),
                 tabPanel("Summary"),
                 tabPanel("Table")
)


server <- function(input, output, session) {
        output$plot <- renderPlot({
            plot(cars, type=input$plotType)
        })
        
        output$summary <- renderPrint({
            summary(cars)
        })
        
        output$table <- DT::renderDataTable({
            DT::datatable(cars)
        })
    }


shinyApp(ui = ui, server = server)
