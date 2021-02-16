Course Project Reproducible Pitch
========================================================
author: Di Zhu
date: 2/15/2021
autosize: true

Stock Price of 4 Big Tech Companies
========================================================

This application collects the stock price of 4 Big Tech Companies in 2020, including Apple, Facebook, Google and Tesla. In the sidebar, you can select the stock that you are interested in. The main panel contains three tabs.  

- The first one shows the stock chart of selected company. 
- The second one gives you more detailed information. 
- The last tab is associated supporting documentation to help you get started using the application. 

The links to the shiny app: [Link](https://zdzd18.shinyapps.io/course_project_shiny_app/)

The links to the ui.R and server.R:
[link](https://github.com/zdzd18/Developing-Data-Products/tree/gh-pages/Course-Project)

Load The data and Create The Data Frame 
========================================================

#### The stock data is collected from Yahoo Finance and stored in the stocks data frame. 




```r
head(stocks)
```

```
        date    AAPL     FB    GOOG   TSLA
1 2020-01-02 75.0875 209.78 1367.37 86.052
2 2020-01-03 74.3575 208.67 1360.66 88.602
3 2020-01-06 74.9500 212.60 1394.21 90.308
4 2020-01-07 74.5975 213.06 1393.34 93.812
5 2020-01-08 75.7975 215.22 1404.32 98.428
6 2020-01-09 77.4075 218.30 1419.83 96.268
```

Tab 1 Stock Chart
========================================================

#### The first tab shows the stock chart of the selected company. Suppose the user selects AAPL, the following plot will be displayed. 

![](Tab 1.png)

Tab 2 Details 
========================================================

#### The second tab gives more details of the selected stock, including the highest and lowest close price in the year. 

![](Tab 2.png)


