## SXPanel
##
SXPanel <- function(inputId, ..., heading = '') {
  pan.header <- shiny::div(class = 'panel-heading clearfix', id = paste0('panelheading_', inputId), heading)
  pan.body <- shiny::div(class = 'panel-body', id = paste0('panelbody_', inputId), ...)
  sx_panel <- shiny::div(class = 'panel panel-default', id = inputId, pan.header, pan.body)
  sx_panel
}
