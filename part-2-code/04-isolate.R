# 04-isolate

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
    label = "Choose a number", 
    value = 25, min = 1, max = 100),
  textInput(inputId = "title", #USER CAN OVERWRITE TITLE
    label = "Write a title",
    value = "Histogram of Random Normal Values"),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num), #NO CALL TO DATA() THIS TIME
         main = isolate(input$title))  #MAINLY TO SHOW HOW TO ISOLATE REACTIVITY FROM TEXT INPUT
  })
}

shinyApp(ui = ui, server = server)