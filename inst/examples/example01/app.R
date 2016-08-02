library(shiny)
library(shinyExtra)

server <- function(input, output) {

#  output$txt1_out <- renderText({input$txt1})

}

ui <- fluidPage(
  br(),
  fluidRow(
    column(4, SXPanel('pan1', heading = 'Regular header', checkbox = TRUE, styleclass = 'primary', icon = 'record',
                      h4('here is some text in the body'),
                      SXLabel('lab1', NULL, styleclass = 'success'),
                      SXLabel('lab1', 'This is a clickable label', styleclass = 'success', link='http://www.google.com')
    )),
    column(4, SXPanel('pan2', heading = 'Larger header', checkbox = TRUE, text_size = 'large', styleclass = 'success', collapsible = T, icon = 'ok',
                      h3('some text'),
                      SXTextArea('txt1', 'Text Area Input', placeholder = 'enter some text', resizable = FALSE),
                      actionButton('but1', 'A BUTTON'))),
    column(4, SXPanel('pan3', collapsible = T, checkbox = T, heading = 'This is a very long header which will take up quite a bit of room, maybe too much!', text_size = 'small', styleclass = 'danger', icon = 'ok'))
  )
#  verbatimTextOutput('txt1_out')
)

shinyApp(server = server, ui = ui)
