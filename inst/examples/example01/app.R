library(shiny)
library(shinyExtra)

server <- function(input, output) {

}

ui <- fluidPage(
  br(),
  fluidRow(
    column(4, SXPanel('pan1', heading = 'Regular header', checkbox = TRUE, styleclass = 'primary', icon = 'record',
                      h4('here is some text in the body'))),
    column(4, SXPanel('pan2', heading = 'Larger header', checkbox = TRUE, text_size = 'large', styleclass = 'success', collapsible = T, icon = 'ok',
                      h3('some text'),
                      actionButton('but1', 'A BUTTON'))),
    column(4, SXPanel('pan3', collapsible = T, checkbox = T, heading = 'This is a very long header which will take up quite a bit of room, maybe too much!', text_size = 'small', styleclass = 'danger', icon = 'ok'))
  )
)

shinyApp(server = server, ui = ui)
