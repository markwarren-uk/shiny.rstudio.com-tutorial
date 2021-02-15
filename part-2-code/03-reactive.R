# 03-reactive

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
    label = "Choose a number", 
    value = 25, min = 1, max = 100),
  plotOutput("hist"),
  verbatimTextOutput("stats")
)

server <- function(input, output) {
  
  data <- reactive({   #reactive builds a reactive expression (object) - build it once
    rnorm(input$num)
  })
  
  output$hist <- renderPlot({  #access reactive once
    hist(data())  #call this as a function e.g. data()
  })
  output$stats <- renderPrint({  #access reactive twice
    summary(data())
  })
}

shinyApp(ui = ui, server = server)