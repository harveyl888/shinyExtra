#' SXSortable
#'
#' add a set of labels and make them sortable
#'
#' @param inputId The input slot that will be used to access the data.
#' @param labels A list of labels.
#' @param styleclass A Bootstrap style to apply to the list. (\code{default, primary, success, info, warning, or danger}).
#'
#' @export
SXSortable <- function(inputId, labels = NULL, styleclass = 'default') {
  if (is.null(labels)) return()

  l.labels <- list()
  for (i in 1:length(labels)) {
    l.labels[[i]] <- shiny::tags$span(SXLabel(paste0(inputId, '_label_', i), label = labels[[i]], styleclass = styleclass), class = 'sort_label')
  }

  sortable_js <- shiny::tags$script(paste0('
    // initialize shiny variable containing values
    $(document).on("shiny:connected", function(event) {
      Shiny.onInputChange(\"', inputId, '_val\", [', paste0("\"", labels, "\"", collapse = ","), ']);
    });
    // update shiny variable when sortable list is changed
    $(\"#', inputId, '\").sortable({
      update: function( event, ui) {
        var output = [];
        $(\"#', inputId, ' .label\").each(function(){output.push($(this).text())});
        Shiny.onInputChange(\"', inputId, '_val\", output);
      }
    });'
  ))

  sx_sortable <- shiny::tagList(shiny::div(id = inputId, shiny::tagList(l.labels)), sortable_js)

  htmltools::attachDependencies(sx_sortable, shinySXDep)

  }
