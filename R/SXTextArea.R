#' SXTextArea
#'
#' helper function to include textarea in shiny apps
#'
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or NULL for no label.
#' @param text Text present in the textarea.
#' @param placeholder Placeholder text for the textarea.
#' @param resizable \bold{logical} - Allow textarea to be resized (default = true).
#' @param rows number of rows (defaults to 5).
#' @param cols number of columns (defaults to 40px).  100\% covers the width of the parent.
#'
#' @export
SXTextArea <- function(inputId, label = NULL, text = NULL, placeholder = NULL, resizable = TRUE, rows = 5, cols = 40) {

  if (resizable == TRUE) {
    textarea_class <- 'form-group shiny-input-container'
  } else {
    textarea_class <- 'form-group shiny-input-container textarea-noresize'
  }

  textarea_style <- 'max-width: 100%; max-height: 100%'

  sx_textarea <- shiny::tagList(shiny::tags$div(shiny::tags$strong(label), style="margin-top: 5px;"),
                                shiny::tags$textarea(id = inputId,
                                       class = textarea_class,
                                       style = textarea_style,
                                       placeholder = placeholder,
                                       rows = rows,
                                       cols = shiny::validateCssUnit(cols), text))
  htmltools::attachDependencies(sx_textarea, shinySXDep)
}
