#' SXLabel
#'
#' helper function to include labels in shiny apps
#'
#' @param inputId The input slot that will be used to access the value.
#' @param label The label text.
#' @param styleclass A Bootstrap style to apply to the label. (\code{default, primary, success, info, warning, or danger}).
#' @param link An optional html link associated with the label.
#'
#' @export
SXLabel <- function(inputId, label=NULL, styleclass = 'default', link = NULL) {

  ## add a style
  if (styleclass %in% c('primary', 'info', 'success', 'warning', 'danger', 'inverse', 'link')) {
    lab_class <- paste0('label label-', styleclass)
  } else {
    lab_class <- paste0('label label-default')
  }

  if (is.null(link)) {
    sx_label <- shiny::tags$span(class = lab_class, id = inputId, label)
  } else {
    sx_label <- shiny::tags$a(class = lab_class, id = inputId, label, href = link, target = '_blank')
  }
  htmltools::attachDependencies(sx_label, shinySXDep)
}
