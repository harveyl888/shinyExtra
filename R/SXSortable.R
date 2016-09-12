#' SXSortable
#'
#' add a set of labels and make them sortable
#'
#' @param inputId The input slot that will be used to access the data.
#' @param labels A list of lists of labels.
#' @param styleclass A list of Bootstrap styles to apply to the list. (\code{default, primary, success, info, warning, or danger}).
#' @param headers A list of column headers.
#' @param colorByGroup Logical If true then labels will be recolored when moved.  If false then labels will retain their color when moved
#' @param height A value for the height (default = 120 px)
#' @param width A value for the width (default = maximum label width + 40 px)
#'
#' @export
SXSortable <- function(inputId, labels = NULL, styleclass = NULL, headers = NULL, colorByGroup = TRUE, height = NULL, width = NULL) {
  if (is.null(labels)) return()

  styleclass <- as.list(styleclass)
  if (length(styleclass) < length(labels)) {
    styleclass <- c(styleclass, rep('default', length(labels) - length(styleclass)))
  }

  headers <- as.list(headers)
  if (length(headers) < length(labels)) {
    headers <- c(headers, rep('no title', length(labels) - length(headers)))
  }

  if (is.null(height)) {
    height <- '120px'
  } else {
    height <- shiny::validateCssUnit(height)
  }

  l.labels <- list()
  boxstyle <- paste0('height:', height, ';')
  for (i in 1:length(labels)) {
    l1 <- list()
    if (length(labels[[i]] > 0)) {
      for (j in 1:length(labels[[i]])) {
        l1[[j]] <- shiny::tags$span(SXLabel(paste0(inputId, '_label_', i, '_', j), label = labels[[i]][[j]], styleclass = styleclass[[i]]), class = 'sort_label')
      }
      l.labels[[i]] <- shiny::div(id = paste0(inputId, '_', i), class = 'sortGroupOuter', 'data-value' = jsonlite::toJSON(labels[[i]]), style = 'display:inline-block; vertical-align:top;',
                                  shiny::div(id = paste0(inputId, '_', i, '_title'), shiny::span(headers[[i]]), class = 'overflowText'),
                                  shiny::div(
                                    id = paste0(inputId, '_', i, '_labels'), class = paste0('connectedSortable_', inputId, ' sortGroup'), shiny::tagList(l1), style = boxstyle
                                  )
      )
    } else {
      l.labels[[i]] <- shiny::div(id = paste0(inputId, '_', i), class = 'sortGroupOuter', style = 'display:inline-block; vertical-align:top;',
                                  shiny::div(id = paste0(inputId, '_', i, '_title'), shiny::span(headers[[i]]), class = 'overflowText'),
                                  shiny::div(
                                    id = paste0(inputId, '_', i, '_labels'), class = paste0('connectedSortable_', inputId, ' sortGroup'), shiny::tagList(l1), style = boxstyle
                                  )
      )
    }

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
    $(\"', paste0(paste0("#", inputId, "_", seq_along(labels), "_labels"), collapse = ', '), '\").sortable({
      connectWith:".connectedSortable_', inputId, '",
      create: function( event, ui) {
        var setWidth = ', ifelse(is.null(width), "null", paste0("\"", shiny::validateCssUnit(width), "\"")), ';
        if (setWidth === null) {
          var widths = [];
          $(\"#', inputId, ' .sort_label .label").each(function() { widths.push($(this).outerWidth(true)) });
          maxWidth = Math.max.apply(Math, widths);
          $(\"#', inputId, ' .sortGroupOuter\").width(maxWidth + 40);
          $(\"#', inputId, ' .overflowText\").width(maxWidth + 40);
        } else {
          $(\"#', inputId, ' .sortGroupOuter\").width(setWidth);
          $(\"#', inputId, ' .overflowText\").width(setWidth);
        }
      },
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
      },
      receive: function(event, ui) {
        var colorByGroup = ', ifelse(colorByGroup, "true", "false"), ';
        var styleClass = [', paste0("\"", styleclass, "\"", collapse = ", "), '];
        if(colorByGroup) {
          var parentid = ui.item.parent().prop("id");
          var splitname = parentid.split("_");
          var parentref = parseInt(splitname[splitname.length - 2]);
          ui.item.find(".label").removeClass().addClass("label label-" + styleClass[parentref - 1]);
        }
      }
    })
  ')

  sortable_js <- shiny::tags$script(sortable_js)

  sx_sortable <- shiny::tagList(shiny::div(id = inputId, shiny::tagList(l.labels)), sortable_js)

  htmltools::attachDependencies(sx_sortable, shinySXDep)

  }
