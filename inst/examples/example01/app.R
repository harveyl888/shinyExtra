library(shiny)
library(shinyExtra)

server <- function(input, output) {

}

ui <- fluidPage(
  br(),
  fluidRow(
    column(4, SXPanel('pan1', styleclass = 'success', icon = 'ok')),
    column(4, SXPanel('pan1', heading = 'my panel', styleclass = 'danger', icon = 'ok'))
  )
)

shinyApp(server = server, ui = ui)
