shinyServer(function(input, output, session) {
  
  output$config_list <- renderPrint({ list(weight = input$weight,
                                           agg_method = input$agg_method) })
  
  observeEvent(input$save_config, { 
    jsonlite::write_json(list(weight = input$weight,
                              agg_method = input$agg_method),
                         "config.json")
  })
  
  observeEvent(input$load_config, { 
    config <- jsonlite::read_json("config.json")
    updateSliderInput(session, "weight", value = config$weight)
    updateRadioButtons(session, "agg_method", selected = config$agg_method)
  })
})