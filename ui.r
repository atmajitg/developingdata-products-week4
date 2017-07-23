#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Geometric Brownian Motion"),
        p("This application generates random stock prices in a year based on a Geometric Brownian Motion with the following inputs:"),
        p("-The initial stock price"),
        p("-The drift component"),
        p("-The volatility"),
        p("-The number of steps in a year"),
        p("The refresh botton will generate different random numbers and differet stock paths."),
        # Sidebar with a slider input for number of bins 
        sidebarLayout(
                sidebarPanel(
                        h3("Inputs"),
                        numericInput("s0","Initial Stock Price:",min = 1,max = 1000,value = 100),
                        sliderInput("slidermu","Drift mu:",value=0.01,min = -1,max = 1,step = 0.01),
                        sliderInput("slidersigma","Volatility sigma:",value=0.02,min = 0,max = 1),
                        selectInput("step","Number of Steps in a Year:",choices = c("N=252,Daily","N=52,Weekly")),
                        actionButton("rerun", "Refresh")
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        h3("Graph of Stock Prices"),
                        plotOutput("Plot")
                )
        )
))