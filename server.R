library(shiny)

# package (which generally comes preloaded).
data <- read.csv("energia.csv", sep=",", header=TRUE)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  output$inputValue <- renderPrint({input$fuel})

  # Generate a summary of the selected fuel
  output$summary <- renderPrint({
    summary(subset(data,select = input$fuel))
  })
  
  # rate growth from 2000 to 2014
  output$rateValue <- renderPrint ({

      for (i in 1:14) {
      growth_rate <- ((data[i+1,input$fuel]-data[i,input$fuel])/data[i,input$fuel])*100
      growth_rate
      print(paste(round(growth_rate,2),"%"))
    }
            })

  # Fill in the spot we created for a plot
    output$consumePlot <- renderPlot({
  
    # Render a barplot
    barplot(data[,input$fuel], 
            main=input$fuel,
            ylab="Energy Consumption, Petajoules (PJ)",
            xlab="Year", names.arg = c("2000", "2001", "2002", "2003",
                                       "2004", "2005", "2006", "2007", 
                                       "2008", "2009", "2010", "2011",
                                       "2012", "2013", "2014"))
    
      })
})

