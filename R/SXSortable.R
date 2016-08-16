#' SXSortable
#'
#' add a set of labels and make them sortable
#'
#' @param inputId The input slot that will be used to access the data.
#' @param labels A list of labels.
#' @param styleclass A Bootstrap style to apply to the list. (\code{default, primary, success, info, warning, or danger}).
#'
#' @export
SXSortable <- function(inputId, labels = NULL, styleclass = NULL) {
  if (is.null(labels)) return()
  styleclass <- as.list(styleclass)
  if (length(styleclass) < length(labels)) {
    styleclass <- c(styleclass, rep(length(labels) - length(styleclass), 'default'))
  }

  l.labels <- list()
  for (i in 1:length(labels)) {
    l1 <- list()
    for (j in 1:length(labels[[i]])) {
      l1[[j]] <- shiny::tags$span(SXLabel(paste0(inputId, '_label_', i, '_', j), label = labels[[i]][[j]], styleclass = styleclass[[i]]), class = 'sort_label')
    }
    l.labels[[i]] <- shiny::div(id = paste0(inputId, '_', i), class = paste0('connectedSortable_', inputId, ' sortGroup'), shiny::tagList(l1), style = 'display:inline-block; vertical-align:top;')
  }


  ## Generate javascript

  sortable_js <- paste0('
    // initialize shiny variable containing values
    $(document).on("shiny:connected", function(event) {
    ')
  for (i in 1:length(labels)) {
    sortable_js <- paste0(sortable_js, '
      Shiny.onInputChange(\"', inputId, '_val_', i, '\" , [', paste0("\"", labels[[i]], "\"", collapse = ","), ']);
                          ')
  }
  sortable_js <- paste0(sortable_js, '
    });
    // update shiny variable when sortable list is changed
    $(\"', paste0(paste0("#", inputId, "_", seq_along(labels)), collapse = ', '), '\").sortable({
      connectWith:".connectedSortable_', inputId, '",
      update: function( event, ui) {
        var output = [];
        var counter = 0;
        $(\"#', inputId, ' .sortGroup\").each(function(){
          output = [];
          counter ++;
          $(this).find(".label").each(function(){
            output.push($(this).text());
          })
          Shiny.onInputChange(\"', inputId, '_val_\" + counter, output);
        });
      }
    })
                        ')
  sortable_js <- shiny::tags$script(sortable_js)

  sx_sortable <- shiny::tagList(shiny::div(id = inputId, shiny::tagList(l.labels)), sortable_js)

  htmltools::attachDependencies(sx_sortable, shinySXDep)

  }
