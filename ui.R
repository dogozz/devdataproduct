library(shiny)

# Loading data.
data <- read.csv("energia.csv", sep=",", header=TRUE)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Energy consumption for electricity generation"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("fuel", "Type of fuel:",
                    choices=c("Total", "Natural.Gas","Fuel.Oil", "Diesel","Carbon", "Uranium")),
        
        hr(),
        helpText("Data from Statistical and Geographics National Institute from Mexico (www.inegi.gob.mx).")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        h4("The selected fuel is:"),
        verbatimTextOutput("inputValue"),
        h4("Summary:"),
        verbatimTextOutput("summary"),
        h4("The growth rate from 2000 to 2014 is:"),
        verbatimTextOutput("rateValue"),
        
        plotOutput("consumePlot")  
      )
      
    )
  )
)

