#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        output$Plot <- renderPlot({
                input$rerun
                s0 <- input$s0
                mu <- input$slidermu
                sigma <- input$slidersigma
                N <- ifelse(input$step=="N=252,Daily",252,52)
                
                t <- seq(0,1,by=1/N)
                st <- exp((mu-0.5*sigma^2)*(1/N)+sigma*sqrt(1/N)*rnorm(N))
                st <- c(s0,s0*cumprod(st))
                plot(t,st,"l")
        })
        
})