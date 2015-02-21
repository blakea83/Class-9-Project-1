library(shiny)

shinyUI(navbarPage(
                title='State Point Analysis',
                tabPanel('Analysis',
                         sidebarLayout(
                         sidebarPanel(
                                numericInput('INF_Q', 'Flow Rate of Water into the Plant in millions gallons per day (mgd)', 0, min = 0, max = 100, step = 0.1),
                                submitButton('Submit'),
                                numericInput('MLSS', 'Solids Concentration into the Clarifier g/L', 0, min = 0, max = 10000, step = 10), 
                                submitButton('Submit'),
                                sliderInput('RAS_Q','Let the RAS rate in mgd',value=1,min=0,max=100,step=0.1,),
                                submitButton('Submit')             
                                 
                                 ),
                         mainPanel(
                                plotOutput('State_Point')
                                ),
                         )
                        ),
                tabPanel('Documentation')
                )
                        
        )




