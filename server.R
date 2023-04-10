library(shiny)
library(DT)
library(RSQLite)
library(pool)
library(shinyjs)
library(uuid)
library(dplyr)

pool <- dbPool(RSQLite::SQLite(), dbname = "db.sqlite")


shinyServer(function(input, output, session) {
  
  output$config_list <- renderPrint({ list(weight = input$weight,
                                           agg_method = input$agg_method) })
  
  observeEvent(input$save_config, { 
    jsonlite::write_json(list(weight = input$weight,
                              agg_method = input$agg_method,
                              data = input$upload),
                         "config.json")
  })
  
  observeEvent(input$load_config, { 
    config <- jsonlite::read_json("config.json")
    updateSliderInput(session, "weight", value = config$weight)
    updateRadioButtons(session, "agg_method", selected = config$agg_method)
    update
  })
  
  
  #####------------------------uploading a file------------------------#####
  data <- reactive({
    req(input$upload)
    
    ext <- tools::file_ext(input$upload$name)
    switch(ext,
           csv = vroom::vroom(input$upload$datapath, delim = ",", na = c("", "NA")),
           validate("Invalid file; Please upload a .csv or .tsv file")
    )
  })
  
  #####------------------------ the original uploaded data------------------------#####
  output$data <- renderDataTable({
    data <- data()
    if(is.null(input$upload)){
      return("Upload some data first")
    }
    else{
      read.table(input$upload$datapath, sep = ",", header = TRUE, fill=TRUE)
    }
  })
  
  #####------------------------saving the dataframe in SQL------------------------#####

  
  
  
})