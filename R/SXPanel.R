## SXPanel
##
SXPanel <- function(inputId, heading = '', styleclass = 'default', icon = NULL, ...) {

  ## add a style
  if (styleclass %in% c('primary', 'info', 'success', 'warning', 'danger', 'inverse', 'link')) {
    pan_class <- paste0('panel panel-', styleclass)
  } else {
    pan_class <- paste0('panel panel-default')
  }

  ## add an icon
  if (!is.null(icon)) {
    pan_icon <- shiny::tags$span(class = paste0('glyphicon glyphicon-', icon), style = 'float:right')
  } else {
    pan_icon <- NULL
  }

  pan_header <- shiny::div(class = 'panel-heading clearfix', id = paste0('panelheading_', inputId), heading, pan_icon)
  pan_body <- shiny::div(class = 'panel-body', id = paste0('panelbody_', inputId), ...)
  sx_panel <- shiny::div(class = pan_class, id = inputId, pan_header, pan_body)
  sx_panel
}
