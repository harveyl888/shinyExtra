#' SXPanel
#'
#' helper function to include panels in shiny apps
#'
#' @param inputId The input slot that will be used to access the value.
#' @param ... Panel contents.
#' @param heading Panel heading.
#' @param text_size Size for panel heading (NULL = do not change text size, 'small' = 75\% size, 'large' = 150\% size).
#' @param styleclass A Bootstrap style to apply to the button. (\code{default, primary, success, info, warning, or danger}).
#' @param checkbox \bold{logical} - add checkbox to left of panel header.
#' @param collapsible \bold{logical} - Create a collapsible panel.
#' @param removeButton \bold{logical} - Include a button to remove the panel.
#' @param icon Name of a glyphicon icon to include to the right of panel header.
#'
#' @export
SXPanel <- function(inputId, ..., heading = '', text_size = NULL, styleclass = 'default', checkbox = FALSE, collapsible = FALSE, removeButton = FALSE, icon = NULL) {

  ## add a style
  if (styleclass %in% c('primary', 'info', 'success', 'warning', 'danger', 'inverse', 'link')) {
    pan_class <- paste0('panel panel-', styleclass)
  } else {
    pan_class <- paste0('panel panel-default')
  }

  ## add an icon
  if (!is.null(icon)) {
    pan_icon <- shiny::tags$span(class = paste0('glyphicon glyphicon-', icon), style = 'padding-right:10px; padding-left:10px;')
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

  ## remove button
  if (removeButton) {
    pan_remove <- shiny::tags$span(class = 'glyphicon glyphicon-remove-circle',
                                   style = 'color:red;',
                                   onclick = paste0("
                                     Shiny.unbindAll();
                                     $(\"#", inputId, "\").remove();
                                     Shiny.bindAll();
                                   "))
  } else {
    pan_remove <- NULL
  }

  ## collapsible
  if (collapsible & !is.null(heading)) {
    pan_header <- shiny::div(class = 'panel-heading clearfix',
                             shiny::p(class = 'panel-title', style = pan_textsize, pan_check, heading,
                             shiny::span(class = 'pull-right',
                                         pan_icon,
                                         shiny::span(class = 'clickable icon-collapse', shiny::icon('chevron-up', lib='glyphicon'), style =  'padding-right:10px; padding-left:10px;'),
                                         pan_remove)
                             ))
    pan_body <- shiny::div(class = 'panel-collapse collapse in',
                           shiny::div(class = 'panel-body', ...))
  } else {
    pan_header <- shiny::div(class = 'panel-heading clearfix',
                             shiny::p(class = 'panel-title', style = pan_textsize, pan_check, heading,
                                      shiny::span(class = 'pull-right',
                                                  pan_icon,
                                                  pan_remove)
                                      ))
    pan_body <- shiny::div(class = 'panel-body', ...)
  }

  sx_panel <- shiny::div(class = pan_class, id = inputId, pan_header, pan_body)
  htmltools::attachDependencies(sx_panel, shinySXDep)

}
