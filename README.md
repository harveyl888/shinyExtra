# shinyExtra
In a similar manner to the [shinyBS](https://github.com/ebailey78/shinyBS) package by [@ebailey](https://github.com/ebailey78), here are some additional functions that I commonly use in shiny apps.

## Install

```r
library(devtools)
devtools::install_github("harveyl888/shinyExtra")
```

## Usage
``` r
SXPanel(inputId, ..., heading = '', text_size = NULL, styleclass = 'default', checkbox = FALSE, collapsible = FALSE, icon = NULL)
```
Add a bootstrap panel to a shiny app.  The panel can be collapsible and display an glyphicon icon to the right of the panel header.  It may also have a checkbox, displayed to the left of the panel header, which is exposed as inputId_check.

``` r
SXLabel(inputId, label=NULL, styleclass = 'default', link = NULL)
```
Add a label with an optional hyperlink.

``` r
SXTextArea(inputId, label = NULL, text = NULL, placeholder = NULL, resizable = TRUE, rows = 5, cols = 40)
```
Add a textarea, default size = 5 rows, 40px wide.  If cols = '100%' then the textarea will expand to its parent's width.

