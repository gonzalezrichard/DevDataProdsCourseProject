library(shiny)
library(ggplot2)

dataset <- mtcars

shinyUI(fluidPage(

      titlePanel("Miles per Gallon predictor"),
      
      sidebarLayout(
      
      sidebarPanel(
            radioButtons('newam', label = h5("Transmission"),
                         choices = list("Automatic" = 0, "Manual" = 1), 
                         selected = 0),
            sliderInput('newwt', label=h5("Car weight (thousands of pounds)"), 
                        min=1.513, max=5.424, value=1.513, step=0.5, round=0),
            radioButtons('newcyl', label = h5("Number of cylinders"),
                         choices = list("4 cylinders" = 4, "6 cylinders" = 6, 
                                        "8 cylinders" = 8), 
                         selected = 4),
            sliderInput('newhp', label=h5("Gross horsepower"), 
                        min=52, max=335, value=52, step=10, round=0)            
      ),
      
      mainPanel(
            h5(textOutput('pred')),
            plotOutput('plot'),
            h6("Documentation"),
            div("This Shiny app uses a linear model to predict the expected consumption of a car (in miles per gallon). Select in the left panel your choice of of transmission mode, weight, number of cylinders and horsepower. The app will show the predicted value in the main panel, as well as in the plot (big red dot). The other points in the plot are the real observations used to fit the linear model."),
            div("This Shiny app was created as an assignment for the course Developing Data Products, a module of the Data Science Specialization - Coursera, authorized by the Johns Hopkins University")
      )
)))