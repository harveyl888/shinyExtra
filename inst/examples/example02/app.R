library(shiny)
library(shinyExtra)

## Test example to ensure that initial values are set when envoking widget within renderUI


server <- function(input, output, session) {

  output$txt1 <- renderPrint({input$sort1_val_2})
  output$txt2 <- renderPrint({input$sort2_val_2})


  output$uisort2 <- renderUI({
    session$onFlushed(function() {
      session$sendCustomMessage(type = "initSort", 1)
    }, once=TRUE)
    SXSortable('sort2', labels = list(list("label 1", "label 2", "label 3"), list("label 4", "label 5")), styleclass = list("success", "primary"), headers=list("title 1", "title 2"), colorByGroup = TRUE, height = 100)
  })

}

ui <- fluidPage(
  br(),
  column(4,
         SXSortable('sort1', labels = list(list("label 1", "label 2"), list("label 3", "label 4", "label 5")), styleclass = list("success", "primary"), headers=list("title 1", "title 2"), colorByGroup = TRUE, height = 100),
         verbatimTextOutput('txt1')
  ),
  column(4,
         uiOutput('uisort2'),
         verbatimTextOutput('txt2')
  )
)

shinyApp(server = server, ui = ui)
