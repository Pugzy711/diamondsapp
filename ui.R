
library(shiny)
library(ggplot2)
data("diamonds")
shinyUI(fluidPage(
    titlePanel("Predict Diamond Price from Carat Size"),
    sidebarLayout(
        sidebarPanel(
            h3("Carat size:"),
            sliderInput("sliderCarat", "Slide to the desired Carat size of the Diamond?", 0.1, 6, value = 0.7),
            h3("Check box to hide or show Model line used to Predicts Price"),
            checkboxInput("showModel", "Show/Hide Prediction Model", value = TRUE),
            
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("The price (in $) of Diamond for the given Carat size is:"),
            textOutput("pred1"),
        )
    )
))
