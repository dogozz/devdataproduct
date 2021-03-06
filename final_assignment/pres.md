
Developing Data Products Course, Final assignment.
========================================================
author: Domingo Gonzalez
date: August, 2016
autosize: true

Objective
========================================================

In order to demostrate the concepts learned through the Developing Data Products Course, this presentation is carried out by using slidify package in R programming Languaje. The presentation covers the "shiny" package in R to build a data product application. The Shiny application is about an Overview of the Energy consumption for electricity generation in Mexico.

The assignment
========================================================
The Energy consumption for electricity generation application is developed by using the Shiny package. The application shows a brief overview of how the primary energy is consumed from 2000 to 2014 by selecting the type of energy, then showing a summary of basic statistics, the growth rate by year, and a plot of the energy selected. 

The Data 
========================================================

The data used by developing this application can be downladed in the Economic Information Bank (BIE) from the Statistics and Geographics National Institute from Mexico. The link is:
http://www.inegi.org.mx/sistemas/bie/ 


```
      Year          Total       Natural.Gas       Fuel.Oil    
 Min.   :2000   Min.   :1568   Min.   :333.4   Min.   :259.8  
 1st Qu.:2004   1st Qu.:1786   1st Qu.:400.4   1st Qu.:423.4  
 Median :2007   Median :1936   Median :529.0   Median :469.5  
 Mean   :2007   Mean   :1947   Mean   :506.2   Mean   :553.5  
 3rd Qu.:2010   3rd Qu.:2138   3rd Qu.:611.7   3rd Qu.:642.7  
 Max.   :2014   Max.   :2306   Max.   :656.8   Max.   :954.6  
                               NA's   :10                     
     Diesel          Carbon         Uranium      
 Min.   :11.33   Min.   :183.1   Min.   : 63.94  
 1st Qu.:17.18   1st Qu.:243.4   1st Qu.: 98.65  
 Median :18.57   Median :328.8   Median :106.64  
 Mean   :21.15   Mean   :300.3   Mean   :104.37  
 3rd Qu.:23.79   3rd Qu.:345.8   3rd Qu.:114.68  
 Max.   :36.66   Max.   :359.9   Max.   :122.60  
                                                 
```

Conclusion
========================================================

The Energy consumption for electricity generation application offers a brief overview over the primary energy consumed. Furthermore you can view how it has been increased or decreaded over the period of time.
The code for calculating the Growth rate:


```r
for (i in 1:14) {
      growth_rate <- ((data[i+1,input$fuel]-data[i,input$fuel])/data[i,input$fuel])*100
      growth_rate
      print(paste(round(growth_rate,2),"%"))
    }
```
