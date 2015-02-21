library(shiny)

library(UsingR)



shinyServer(
        function(input, output) {
         output$State_Point <- renderPlot({
          
         # Variables pulled from input
                MLSS <- input$MLSS
                
                SVI <- input$SVI
                RAS_Q<- input$RAS_Q
                INF_Q <- input$INF_Q
         # Calculating values for the State Point Plot 
                x_MLSS=seq(0,20,0.1) # g/L
                k=0.41 # Liters/gram
                Vo=0.505 #ft/min
                Vs=100/1000 #mg/L
                Vr=15000 # mg/L
                V_S=Vo*exp(-k*x_MLSS)*(x_MLSS/(x_MLSS+(Vs))) # ft/min
                Clarifier_Area<-3.14*(113/2)^2*2           # Area of equipmlent                                   
                                     
         # Creating the lines and points for the graph
                y_GS=(x_MLSS)*V_S*89.896    # State Point curve, 4.916 is a unit conversion
                SP_x=(MLSS)                                # State Point x
                SP_y=INF_Q/(Clarifier_Area)*(MLSS)*8345    # State Point y 8.345 is a unit conversion
                OROL_Y=(INF_Q/Clarifier_Area)*(x_MLSS)*8345     # Overflow Rate Operating Line
                UROL_X=x_MLSS[x_MLSS>MLSS]                 # Underflow Rate Operating Line x values
                SLR=(INF_Q+RAS_Q)/Clarifier_Area*(UROL_X)*8345# Solids Loading Rate
                UROL_Y=(UROL_X-SP_x)*(-RAS_Q/Clarifier_Area)*8345+SP_y  # Underflow Rate Operating Line y value
         
         # Acutal State Point Plot
                plot(x=x_MLSS,y=y_GS, xlab='Mixed Liquor Suspended Solids (MLSS mg/L)',ylab="Settling Flux (GS) (lb/ft^2/day",main='State Point Graph',type="l")
                points(SP_x,SP_y,col=2,lwd=10)  # State Point
                lines(x=x_MLSS,y=OROL_Y,col=3,lwd=2)
                lines(x=UROL_X,y=UROL_Y,col=4,lwd=2,lty=2)
                legend(x=15,y=35,legend=c("Solids Flux Line","State Point","Overflow Rate","Underflow Rate"),col=c(1,2,3,4),lty=c(1,1,1,2),lwd=c(1,10,2,2))
                
             
          })     
        }
)



# Future 
###add in settling data to get k and Vo and not just the correlation
# Clarifier Area 
# SVI to parameters
# settling data to parameters
# improve statepoint legend
