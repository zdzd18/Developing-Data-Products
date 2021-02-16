# Set up the environment 
library(shiny)
library(quantmod)
library(dplyr)
library(tidyr)
library(plotly)

# Define server for application
shinyServer(function(input, output) {
    
    # Load the data and create the data frame
    from.dat <- as.Date("01/01/20", format = "%m/%d/%y")
    to.dat <- as.Date("12/31/20", format = "%m/%d/%y")
    getSymbols("AAPL", src = "yahoo", from = from.dat, to = to.dat)
    getSymbols("FB", src = "yahoo", from = from.dat, to = to.dat)
    getSymbols("GOOG", src = "yahoo", from = from.dat, to = to.dat)
    getSymbols("TSLA", src = "yahoo", from = from.dat, to = to.dat)
    
    stocks = data.frame(aapl = AAPL$AAPL.Close, fb = FB$FB.Close, 
                        goog = GOOG$GOOG.Close, tsla = TSLA$TSLA.Close)
    date = rownames(stocks)
    stocks = cbind(date = date, stocks)
    rownames(stocks) = 1: nrow(stocks)
    stocks = stocks %>% rename(AAPL = AAPL.Close, FB = FB.Close, 
                               GOOG = GOOG.Close, TSLA = TSLA.Close)
    
    # Create the data frame for the selected stock
    stockSelect <- reactive({
        stockSelect = stocks[, c('date', input$stock)]
        stockSelect$date = as.POSIXct(stockSelect$date)
        stockSelect = rename(stockSelect, price = all_of(input$stock))
        stockSelect
    })
    
    # Return the stock name
    output$stockName <- renderText({
        input$stock
    })
    
    # Return the highest close price
    output$high <- renderText({
        max(stockSelect()[, 2])
    })
    
    # Return the lower close price
    output$low <- renderText({
        min(stockSelect()[, 2])
    })
    
    # Return the stock plot
    output$stockPlot <- renderPlotly({
        
        plot_ly(stockSelect(), x = ~date, y = ~price, 
                type = "scatter", mode = "lines") %>%
            layout(xaxis = list(title = 'Date'), 
                   yaxis = list(title = 'Close Price ($)'))
        
    })
    
    # Return the document for the application
    output$desc <- renderText({
        desc = 'This application collects the stock price of 4 Big Tech 
        Companies in 2020, including Apple, Facebook, Google and Tesla. 
        In the sidebar, you can select the stock that you are interested 
        in. The main panel contains three tabs. The first one shows the  
        stock chart of selected company. The second one gives you more 
        detailed information. This last tab is associated supporting 
        documentation to help you get started using the application. '
        desc
    })

})
