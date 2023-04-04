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
        "Set your configuration here.",
        sliderInput("weight", "Weight:", min = 0, max = 1, value = 0),
        radioButtons("agg_method", label = "Aggregation Method", 
                     choices = list("Equally weighted" = 1, "Weight by points" = 2),
                     selected = 1),
        hr(),
        "Here is what the current configuration settings look like as a list in R:",
        verbatimTextOutput("config_list")
      )
    )))