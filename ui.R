library(shiny)
shinyUI(pageWithSidebar(
 headerPanel("Normal distribution"),
             sidebarPanel(
                     h3('Distribution characteristics'),
                     numericInput('mean', 'Select the mean of the distrubion', 0, min = -100, max = 100, step = 1),
                     numericInput('sd', 'Select the standard deviation of the distrubion', 1, min = 0, max = 100, step = 1),
                     h3('Plot characteristics'),
                     sliderInput('min', 'Select the horizontal axe minimum value', value=-10, min = -100, max = 100, step = 1),
                     sliderInput('max', 'Select the horizontal axe maximum value', value=10, min = -100, max = 100, step = 1),
                     h3('Help'),
                     checkboxInput('help', 'Click to have some help on how to use this site.')
             ),
             mainPanel(
                     h3('Plot'),
                     plotOutput('plot'),
                     h3('Probability to be between min and max value'),
                     p(textOutput('minmax')),
                     p('Probability :'),
                     verbatimTextOutput('prob')
             )
 )       
)