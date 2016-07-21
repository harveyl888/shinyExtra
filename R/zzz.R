.onAttach <- function(libname, pkgname) {
  shiny::addResourcePath('sx', system.file('www', package='shinyExtra'))
}

shinySXDep <- htmltools::htmlDependency('shinyExtra', '0.1', src = c('href' = 'sx'), script = 'shinyExtra.js', stylesheet = 'shinyExtra.css')
