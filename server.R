library(shiny)
library(ggplot2)
data(mtcars)

shinyServer(function(input, output) {
      
      fit <- lm(mpg~am+wt+cyl+hp, mtcars)
 
      pr <- reactive({
            round(as.numeric(predict(fit, 
                                     data.frame(am = as.numeric(input$newam),
                                                wt = as.numeric(input$newwt), 
                                                cyl = as.numeric(input$newcyl), 
                                                hp = as.numeric(input$newhp)))), 
                  digits = 1)
      })
      
      output$pred <- renderPrint({
            paste('Predicted consumption is ', pr(), ' miles per gallon.')
            })        
      
      output$plot <- renderPlot({
            p <- qplot(wt, mpg, data=mtcars, shape = factor(am), 
                       color = factor(cyl), size = hp)
            p <- p + annotate("point", x = as.numeric(input$newwt), 
                              y = pr(), colour = "red", size = 5)
            p <- p + annotate("text", x = as.numeric(input$newwt)+1, y = pr(),
                              label="Predicted mpg consumption")
            p
      }, height = 400)
})