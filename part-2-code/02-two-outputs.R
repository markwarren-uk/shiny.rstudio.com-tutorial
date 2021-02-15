# 02-two-outputs

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
    label = "Choose a number", 
    value = 25, min = 1, max = 100),
  plotOutput("hist"),
  verbatimTextOutput("stats")
)

server <- function(input, output) {
  output$hist <- renderPlot({   #output 1
    hist(rnorm(input$num))
  })
  output$stats <- renderPrint({   #output 2
    summary(rnorm(input$num))
  })
}

shinyApp(ui = ui, server = server)