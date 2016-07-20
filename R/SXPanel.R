## SXPanel
##
SXPanel <- function(inputId, ..., heading = '', text_size = NULL, styleclass = 'default', collapsible = FALSE, icon = NULL) {

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

  ## adjust text size
  if (is.null(text_size)) {
    pan_textsize <- 'font-size: 100%;'
  } else {
    if (text_size == 'small') {
      pan_textsize <- 'font-size: 75%;'
    } else if (text_size == 'large') {
      pan_textsize <- 'font-size: 150%;'
    } else {
      pan_textsize <- 'font-size: 100%;'
    }
  }

  ## collapsible
  if (collapsible & !is.null(heading)) {
    pan_heading <- shiny::a(heading, href=paste0('#panelcollapse_', inputId), 'data-toggle'='collapse')
    pan_body <- shiny::div(class = 'panel-collapse collapse in', id = paste0('panelcollapse_', inputId), shiny::div(class = 'panel-body', id = paste0('panelbody_', inputId), ...))
  } else {
    pan_heading <- heading
    pan_body <- shiny::div(class = 'panel-body', id = paste0('panelbody_', inputId), ...)
  }
  pan_header <- shiny::div(class = 'panel-heading clearfix', id = paste0('panelheading_', inputId), pan_heading, style = pan_textsize, pan_icon)


  sx_panel <- shiny::div(class = pan_class, id = inputId, pan_header, pan_body)
  sx_panel
}
