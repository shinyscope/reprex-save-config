shinyUI(

  fluidPage(
    sidebarLayout(
      sidebarPanel(
        h2("Configuration"),
        "Input selections can be save and loaded as a json file.",
        fluidRow(
          column(4, 
                 actionButton("load_config", label = "Load Config")
                 ),
          column(4,
                 actionButton("save_config", label = "Save Config")
                 )
        )
      ),
      mainPanel(
        tags$h3("Instructions"),
        tags$ol(),
        tags$li("Set your configuration settings in the slider and radio button below."),
        tags$li("Click \"Save Config\" button in sidebar. Check your local directory to see if a config.json file has been created."),
        tags$li("Change settings in slider and radio buttons."),
        tags$li("Click \"Load Config\" to restore previous settings."),
        hr(),
        sliderInput("weight", "Weight:", min = 0, max = 1, value = 0),
        radioButtons("agg_method", label = "Aggregation Method", 
                     choices = list("Equally weighted" = "equally_weighted",
                                    "Weight by points" = "weight_by_points"),
                     selected = 1),
        hr(),
        #upload
        h4("Upload File"),
        fileInput("upload", "Upload a csv file", accept = c(".csv")),
        p("Original Data",
          dataTableOutput("data")),
        hr(),
        "Here is what the current configuration settings look like as a list in R:",
       
        hr(),

        verbatimTextOutput("config_list")
      )
    )))