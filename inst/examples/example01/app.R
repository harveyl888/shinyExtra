library(shiny)
library(shinyExtra)

server <- function(input, output) {

}

ui <- fluidPage(
  br(),
  fluidRow(
    column(4, SXPanel('pan1', styleclass = 'success')),
    column(4, SXPanel('pan1', heading = 'my panel', styleclass = 'danger'))
  )
)

shinyApp(server = server, ui = ui)
