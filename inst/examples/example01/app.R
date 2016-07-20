library(shiny)
library(shinyExtra)

server <- function(input, output) {

}

ui <- fluidPage(
  fluidRow(
    column(4, SXPanel('pan1', header = 'my panel'))
  )
)

shinyApp(server = server, ui = ui)
