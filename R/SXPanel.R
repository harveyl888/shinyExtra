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
    pan_icon <- shiny::tags$span(class = paste0('glyphicon glyphicon-', icon), style = 'padding-right:20px')
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

  #   ## collapsible
  if (collapsible & !is.null(heading)) {
    pan_header <- shiny::div(class = 'panel-heading clearfix',
                             shiny::p(class = 'panel-title', style = pan_textsize, heading,
                             shiny::span(class = 'pull-right',
                                         shiny::span(pan_icon),
                                         shiny::span(class = 'clickable', shiny::icon('chevron-up', lib='glyphicon', class = 'icon-collapse')))))
    #                             shiny::span(class = 'pull-right clickable', shiny::icon('chevron-up', lib='glyphicon', class = 'icon-collapse'))))
    pan_body <- shiny::div(class = 'panel-collapse collapse in',
                           shiny::div(class = 'panel-body', ...))
  } else {
    pan_header <- shiny::div(class = 'panel-heading clearfix',
                             shiny::p(class = 'panel-title', style = pan_textsize, heading,
                                      shiny::span(class = 'pull-right', shiny::span(pan_icon))))
    pan_body <- shiny::div(class = 'panel-body', ...)
  }

  sx_panel <- shiny::div(class = pan_class, id = inputId, pan_header, pan_body)
  htmltools::attachDependencies(sx_panel, shinySXDep)

}
