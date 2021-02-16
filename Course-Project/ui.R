# Set up the environment 
library(shiny)
library(plotly)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Stock Price of 4 Big Tech Companies in 2020"),

    # Sidebar layout
    sidebarLayout(
        
        # Sidebar with a radio button input
        sidebarPanel(
            radioButtons('stock', h3('Stocks'), selected = 'AAPL', 
                         choices = list('AAPL'='AAPL', 'FB'='FB', 
                                        'GOOG'='GOOG', 'TSLA'='TSLA'))
        ),

        # Main panel with three tabs
        mainPanel(
            tabsetPanel(type = "tabs", 
                        tabPanel('Stock Chart', br(), 
                                 span(textOutput('stockName'), 
                                      style = 'font-size: 25px'), 
                                 plotlyOutput("stockPlot")),
                        tabPanel('Details', br(), 
                                 h4("High:"), textOutput("high"), 
                                 h4("Low:"), textOutput("low")), 
                        tabPanel('Description', br(), 
                                 span(textOutput('desc'), 
                                      style = 'font-size: 18px')))
            
        )
    )
))
