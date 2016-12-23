library(shiny)
library(shinyExtra)

server <- function(input, output) {

  output$txt1 <- renderPrint({input$sort1_val_2})


}

ui <- fluidPage(
  br(),
  fluidRow(
    column(4, SXPanel('pan1', heading = 'Regular header', checkbox = TRUE, styleclass = 'primary', icon = 'record', removeButton = TRUE,
                      h4('here is some text in the body'),
                      SXLabel('lab1', NULL, styleclass = 'success'),
                      SXLabel('lab1', 'This is a clickable label', styleclass = 'success', link='http://www.google.com')
    )),
    column(4, SXPanel('pan2', heading = 'Larger header', checkbox = TRUE, text_size = 'large', styleclass = 'success', collapsible = T, icon = 'ok', removeButton = TRUE,
                      h3('some text'),
                      SXTextArea('txt1', 'Text Area Input', placeholder = 'enter some text', resizable = FALSE),
                      actionButton('but1', 'A BUTTON'))),
    column(4, SXPanel('pan3', collapsible = T, checkbox = T, heading = 'This is a very long header which will take up quite a bit of room, maybe too much!', text_size = 'small', styleclass = 'danger', icon = 'ok',
#                      SXSortable('sort1', labels = list(list('label1', 'label2', 'label3'), list('label4', 'label5', 'label6'), list('X1', 'X2', 'X3', 'X4')), styleclass = list('success', 'primary', 'warning'), height = 100)
#SXSortable('sort1', labels = list(list("label 1", "label 2", "label 3"), list("label 4", "label 5")), styleclass = list("success", "primary"), headers=list("title 1", "title 2"), colorByGroup = TRUE, height = 100)
SXSortable('sort1', labels = list(list("label 1", "label 2", "label 3"), list()), styleclass = list("success", "primary"), headers=list("title 1", "title 2"), colorByGroup = TRUE, height = 100)
    ))
  ),
  verbatimTextOutput('txt1')
)

shinyApp(server = server, ui = ui)
