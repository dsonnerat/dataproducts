library(shiny)
#options(shiny.trace=TRUE)
shinyServer(
        function(input, output){

                minmaxErrorMsh <- 'Max value has to be gretter than min value'
                
                output$plot = renderPlot({
                        if(input$help){
                                helpMsg <- paste('This site allows you to specify normal distribution mean and standard deviation.',
                                                'You also have to give an interval. The normal distribution probability density function',
                                                'calculated within the interval is then plotted and  the probability to have a value',
                                                'within this interval is also calculated.\n',
                                                'To make it work you have to:',
                                                ' - Select the mean of the normal distribution.',
                                                ' - Select the standard deviation or the normal distribution.',
                                                ' - Select the min of the interval.',
                                                ' - Select the max of the interval.\n',
                                                'The système will automatically plot the normal distribution probability density function',
                                                'and calculate the probability.', sep='\n')
                                
                                plot.new()
                                text(0.5,0.5,helpMsg , col='blue')
                        } else if(input$min >= input$max){
                                plot.new()
                                text(0.5,0.5,minmaxErrorMsh, col='red')
                          
                        }else{
                                x <- seq(from=input$min, to = input$max, length.out = 1000)
                                plot(x=x, y=dnorm(x,mean=input$mean, sd = input$sd), type='l',
                                     main=paste('Normal distribution probability density function\n mean = '
                                                , input$mean , ', standard deviation = ', input$sd),
                                     xlab='X',
                                     ylab='',
                                     col='blue')
                                abline(v=input$min, col='red')
                                abline(v=input$max, col='red')
                        }
                   
                }
                )
                
                output$prob = renderText({
                        if(input$min >= input$max){
                                return(minmaxErrorMsh)
                        }
                        else{
                                return( pnorm(q=input$max, mean=input$mean, sd=input$sd)
                                - pnorm(q=input$min, mean=input$mean, sd=input$sd))
                        }
                })
                
                output$minmax = renderText({ paste('min =',input$min, ', max =', input$max)})
                
        }
)