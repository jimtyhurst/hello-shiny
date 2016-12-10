library(shiny)
library(datasets)

# Based on code from:
#   https://shiny.rstudio.com/articles/build.html

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application.
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

# Server logic required to plot various variables against 
# miles per gallon (mpg).
shinyServer(function(input, output) {
  
  ####################
  # Generate a plot of the requested variable against mpg and only 
  
  # Compute the formula text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions.
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # Return the formula text for printing as a caption.
  output$caption <- renderText({
    formulaText()
  })
  
  # Only include outliers if requested.
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mpgData,
            outline = input$outliers)
  })
  
  ####################
  # Generate a histogram of observations for the selected property.

  # Translate variable selection to displayable name.
  variableNameMap <- list("cyl" = "Cylinders", "am" = "Transmission", "gear" = "Gears")
  variableName <- reactive({
    return(variableNameMap[[input$variable]])
  })
  
  frequencyTitle <- "Frequency of Observations"
  frequencyXLabel <- reactive({
    paste("Number of", variableName())
  })
  frequencyYLabel <- "Frequency"
  
  output$properties <- renderPlot({
    if (isCategorical[[input$variable]]) {
      plot(mpgData[, input$variable], main = frequencyTitle, ylab = frequencyYLabel)
    } else {
      hist(mpgData[, input$variable], main = frequencyTitle, xlab = frequencyXLabel(), ylab = frequencyYLabel)
    }
  })
  
  isCategorical <- list("cyl" = FALSE, "am" = TRUE, "gear" = FALSE)
})
