#` This is a simply shiny server file
#` It performs a regression on MTCARS dataset using variables selected in UI, and then passes some output from that regression back to UI
#` Selectable variables are all but AM (which is always used) and MPG (which is being predicted)
# `Output is a residual plot, and 3 values: AM regression coefficient, its P-value, and STD of residuals.
#` @author Youri Matiounine

library(shiny)
data(mtcars)

# Define server logic required to draw the plot and 3 reported values
shinyServer(function(input, output) {

  # reactive function for the regression - return fit  
  fit1 <- reactive({
    xx <- mtcars$am
  if( input$use_wt == TRUE )
    xx <- cbind(xx,mtcars$wt)
  if( input$use_hp == TRUE )
    xx <- cbind(xx,mtcars$hp)
  if( input$use_cyl == TRUE )
    xx <- cbind(xx,mtcars$cyl)
  if( input$use_disp == TRUE )
    xx <- cbind(xx,mtcars$disp)
  if( input$use_drat == TRUE )
    xx <- cbind(xx,mtcars$drat)
  if( input$use_qsec == TRUE )
    xx <- cbind(xx,mtcars$qsec)
  if( input$use_vs == TRUE )
    xx <- cbind(xx,mtcars$vs)
  if( input$use_gear == TRUE )
    xx <- cbind(xx,mtcars$gear)
  if( input$use_carb == TRUE )
    xx <- cbind(xx,mtcars$carb)
  lm(mtcars$mpg~xx)
  })
  
  # produce residual plot
  output$Plot1 <- renderPlot({
    plot(resid(fit1())~mtcars$mpg,xlab="MPG",ylab="Residuals",main="Residual Plot")
  })
  
  # produce regression coeff of AM variable
  output$Text1 <- renderText({
    sf1<-summary(fit1())
    sf1$coefficients[2,1] # coeff of AM variable
  })
  
  # produce P-value of AM variable
  output$Text2 <- renderText({
    sf1<-summary(fit1())
    sf1$coefficients[2,4] # P-value of AM variable
  })
  
  # produce STD of residuals
  output$Text3 <- renderText({
    sf1<-summary(fit1())
    sf1$sigma # STD of residuals
  })
})
