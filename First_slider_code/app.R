library(shiny)
ui <- fluidPage(
    sliderInput(inputId = "num",
                label = "Choose a number",
                value = 25, min = 1, max = 100),
    sliderInput(inputId = "ave",
                label = "Choose a mean value",
                value = 50, min = 25, max = 100),
    sliderInput(inputId = "sd",
                label = "Choose a standard deviation",
                value = 5, min = 2, max = 10),
    plotOutput("hist")
)

server <- function(input, output) {
    
    data <- reactive({
        rnorm(input$num, mean = input$ave, sd = input$sd)
    })
     
    # output$hist <- renderPlot({
    #     title <- paste(length(data()), "random normal values", sep = " ")
    #     xaxis <- paste("Random normal distribution of", length(data()), 
    #                    "selected values with mean =", round(mean(data()), 0), "and sd =", round(sd(data()), 0), sep = " ")
    #     hist(data(), breaks = 100, main = title, xlab = xaxis)
    # })
    #USING DATA() NEEDED ROUNDING AND COULD GO EITHER WAY SO NOT REPRESENTATVE OF INPUTS 
    
    #BETTR OFF USING INPUT VALUES FOR TITLE ETC
    output$hist <- renderPlot({
        title <- paste(input$num, "random normal values", sep = " ")
        xaxis <- paste("Random normal distribution of", input$num,
        "selected values with mean =", input$ave, "and sd =", input$sd, sep = " ")
        hist(data(), breaks = 100, main = title, xlab = xaxis)
    })
}

shinyApp(ui = ui, server = server)