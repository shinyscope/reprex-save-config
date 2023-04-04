shinyServer(function(input, output, session) {
  config <- list()
  
  config$weight <- reactive(input$weight)
  config$agg_method <- reactive(input$agg_method)
  
  output$config_list <- renderPrint({ config })
})