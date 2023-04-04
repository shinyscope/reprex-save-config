shinyServer(function(input, output, session) {
  
  output$config_list <- renderPrint({ list(weight = input$weight,
                                           agg_method = input$agg_method) })
  
  observeEvent(input$save_config, { 
    jsonlite::write_json(list(weight = input$weight,
                              agg_method = input$agg_method),
                         "config.json")
  })
})