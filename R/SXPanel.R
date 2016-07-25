## SXPanel
##
SXPanel <- function(inputId, ..., heading = '', text_size = NULL, styleclass = 'default', checkbox = FALSE, collapsible = FALSE, icon = NULL) {

  ## add a style
  if (styleclass %in% c('primary', 'info', 'success', 'warning', 'danger', 'inverse', 'link')) {
    pan_class <- paste0('panel panel-', styleclass)
  } else {
    pan_class <- paste0('panel panel-default')
  }

  ## add an icon
  if (!is.null(icon)) {
    pan_icon <- shiny::tags$span(class = paste0('glyphicon glyphicon-', icon), style = 'padding-right:20px')
  } else {
    pan_icon <- NULL
  }

  ## adjust text size
  if (is.null(text_size)) {
    pan_textsize <- 'font-size: 100%;'
    pan_checktransform <- 'transform: scale(1.5, 1.5); margin-right: 10px;'
  } else {
    if (text_size == 'small') {
      pan_textsize <- 'font-size: 75%;'
      pan_checktransform <- 'transform: scale(1.0, 1.0); margin-right: 10px;'
    } else if (text_size == 'large') {
      pan_textsize <- 'font-size: 150%;'
      pan_checktransform <- 'transform: scale(2.0, 2.0); margin-right: 10px;'
    } else {
      pan_textsize <- 'font-size: 100%;'
      pan_checktransform <- 'transform: scale(1.5, 1.5); margin-right: 10px;'
    }
  }

  ## checkbox
  if (checkbox) {
    pan_check <- shiny::tags$input(type="checkbox", id=paste0(inputId, '_check'), style = pan_checktransform)
  } else {
    pan_check <- NULL
  }

  ## collapsible
  if (collapsible & !is.null(heading)) {
    pan_header <- shiny::div(class = 'panel-heading clearfix',
                             shiny::p(class = 'panel-title', style = pan_textsize, pan_check, heading,
                             shiny::span(class = 'pull-right',
                                         shiny::span(pan_icon),
                                         shiny::span(class = 'clickable', shiny::icon('chevron-up', lib='glyphicon', class = 'icon-collapse')))))
    pan_body <- shiny::div(class = 'panel-collapse collapse in',
                           shiny::div(class = 'panel-body', ...))
  } else {
    pan_header <- shiny::div(class = 'panel-heading clearfix',
                             shiny::p(class = 'panel-title', style = pan_textsize, pan_check, heading,
                                      shiny::span(class = 'pull-right', shiny::span(pan_icon))))
    pan_body <- shiny::div(class = 'panel-body', ...)
  }

  sx_panel <- shiny::div(class = pan_class, id = inputId, pan_header, pan_body)
  htmltools::attachDependencies(sx_panel, shinySXDep)

}
