library(shiny)
library(ggplot2)
data("diamonds")

shinyServer(function(input, output) {
    #mtcars$mpgsp <- ifelse(mtcars$mpg - 20 > 0, mtcars$mpg - 20, 0)
    model1 <- lm(price ~ carat, data = diamonds)
    modelpred <- reactive({
        caratInput <- input$sliderCarat
        predict(model1, newdata = data.frame(carat = caratInput))
    })
    output$plot1 <- renderPlot({
        caratInput <- input$sliderCarat
        
        plot(diamonds$carat, diamonds$price, xlab = "Diamond Carats", 
             ylab = "Price (in Dollars)", bty = "n", pch = 16, cex = 1,
             xlim = c(0.1, 6), ylim = c(320, 44300))
        if(input$showModel){
            abline(model1, col = "blue", lwd = 2)
        }
        points(caratInput, modelpred(), col = "blue", pch = 16, cex = 2)
    })
    
    output$pred1 <- renderText({
        modelpred()
    })
})

    
