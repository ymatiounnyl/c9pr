#` This is a simply shiny UI file
#` It allows user to select which variables are used in a regression, and then displays some output from that regression.
#` Selectable variables are all but AM (which is always used) and MPG (which is being predicted)
# `Output is a residual plot, and 3 values: AM regression coefficient, its P-value, and STD of residuals.
#` @author Youri Matiounine

library(shiny)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Multi-variate analysis of data in MTCARS dataset: impact of transmission type on MPG"),
  
  # Sidebar with checkbox inputs
  sidebarLayout(
    sidebarPanel(
       h3("Select variables to use in regression"),
       checkboxInput("use_wt","Use weight",value = FALSE),
       checkboxInput("use_hp","Use horse power",value = FALSE),
       checkboxInput("use_cyl","Use number of cylinders",value = FALSE),
       checkboxInput("use_disp","Use engine displacement",value = FALSE),
       checkboxInput("use_drat","Use rear axle ratio",value = FALSE),
       checkboxInput("use_qsec","Use 1/4 mile time",value = FALSE),
       checkboxInput("use_vs","Use V/S",value = FALSE),
       checkboxInput("use_gear","Use number of gears",value = FALSE),
       checkboxInput("use_carb","Use number of carburators",value = FALSE)
    ),
    
    # Show residual plot and 3 text outputs
    mainPanel(
       h3("Results of regression analysis"),
       plotOutput("Plot1"),
       
       h4("Increase in MPG for a manual transmission:"),
       textOutput("Text1"),
       
       h4("P-value of impact of a manual transmission on MPG:"),
       textOutput("Text2"),
       
       h4("STD of residuals:"),
       textOutput("Text3")
    )
  )
))
