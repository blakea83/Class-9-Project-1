library(shiny)

shinyUI(navbarPage(
                title='State Point Analysis',
                tabPanel('Application',
                         sidebarLayout(
                         sidebarPanel(
                                numericInput('INF_Q', 'Flow Rate of Water into the Plant in millions gallons per day (mgd) (Default 10, press sumbit)', 0, min = 0, max = 100, step = 0.1),
                                submitButton('Submit'),
                                numericInput('MLSS', 'Solids Concentration into the Clarifier (g/L) (Default 2, press sumbit)', 0, min = 0, max = 10000, step = 10), 
                                submitButton('Submit'),
                                sliderInput('RAS_Q','Recycle/RAS rate (mgd) (Default 1, press sumbit)',value=1,min=0,max=100,step=0.1,),
                                submitButton('Submit')             
                                 
                                 ),
                         mainPanel(
                                plotOutput('State_Point')
                                ),
                         )
                        ),
                tabPanel('Documentation',
                         helpText("This application is for use in wastewater treatment or treating the ",
                                  "what goes down the drain or down a toilet.  The cleaned water is ",
                                  "sent to a river where people will later be taking drinking water.",
                                  "The image below shows the urban water cycle for clarification."),
                        imageOutput("overall"),
                         
                        helpText("Treating wastewater involves growing bacteria in aeration tanks to eat the", 
                                  "wastewater coming from the sewers. The bacteria are removed by letting",
                                  "the bacteria settle in large settling tanks or clarifiers. The bacteria settle and concentrate",
                                  "in the bottom of the tank. The clean water that is at the top of the tank is then",
                                  "sent to the river.The image below shows cleaned water leaving the settling tanks."),      
                 
                        imageOutput("overall2"),
                        helpText("Most of the bacteria settle in the bottom of the tank.  Most settled bacteria are recycled to the front of the plant to treat more wastewater.",
                                  "The remaining settled bacteria are turned into compost or burned."),
                        
                        helpText("This application tells a plant operator if too much water or solids are being",
                                  "fed to the settling tanks. The application takes; the flow into the plant (Influent),",
                                  "the concentration of solids being fed to the tank (MLSS), and the flow rate of the",
                                  "recycled bacteria from the settling tanks or RAS (return activated sludge).",
                                  "The image below shows a cross section of the settling tank."),
                        
                        imageOutput("overall3"),
                        helpText("The image shows the outlet zone which is where cleaned water leaves the tank as shown in the 2nd image.",
                                 "Flow enters the tank via the pipe in the middle of the tank.",
                                 "The sludge zone is the lower part of the settling tank where solids have settled and are concentrated."),
                        helpText("The State Point Graph has the concentration of solids/bacteria on the x-axis",
                                  ",and the y-axis gives the flux or flow rate of solids per square foot of the",
                                  "settling tanks each day."),
        
                        helpText("The application creates a thin black line (Solids Flux Line) that show",
                                  "how well the bacteria settle based on the properties of the bactiera.",
                                  "The bacteria settle at different rates based on what the solid's concentration is.",
                                  "Therefore, the settling velocity and flux changes at different depths in the tank."),
                                 
                        helpText("The green line represents the overflow rate which comes from the flow rate into the plant. "),
                        helpText("The Red dot is the state point.  The state point's x-value is the solid's concentration coming into the settling tanks.",
                                  "The state point's y-value is the required flux in the settling tanks to allow the solids to",
                                  "settle."),  
                        helpText("If the state point is above the solids flux line, solids sent to the settling tank",
                                  "will not competely settle.  Then solids will go into rivers and cause fish to die off and ",
                                  "harm the downstream town's water sources."),   
                        helpText("The blue dashed line represents the amount of solids that can be taken from the bottom of the settling tank."),
                        helpText("If the recycle rate is not high enough, the blue line will cross the black solids flux line, so",
                                  "solids will eventually spill out of the settling tank into the river. The operator should ",
                                  "increase the recycle (RAS) rate until the blue line does not cross the black line if possible."),
                        helpText("This application is to help wastewater plant operators prevent bacteria from spiling into the river.")

                         
                         )
                )
                        
        )




