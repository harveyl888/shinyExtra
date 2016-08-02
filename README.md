# shinyExtra
In a similar manner to the [shinyBS](https://github.com/ebailey78/shinyBS) package by [@ebailey78](https://github.com/ebailey78), here are some additional functions that I often use in shiny apps.

## Install

```r
library(devtools)
devtools::install_github("harveyl888/shinyExtra")
```

## Usage
#### SXPanel
``` r
SXPanel(inputId, ..., heading = '', text_size = NULL, styleclass = 'default', checkbox = FALSE, collapsible = FALSE, icon = NULL)
```
Add a bootstrap panel to a shiny app.  The panel can be collapsible and display an glyphicon icon to the right of the panel header.  It may also have a checkbox, displayed to the left of the panel header, which is exposed as inputId_check.
#### SXlabel
``` r
SXLabel(inputId, label=NULL, styleclass = 'default', link = NULL)
```
Add a label with an optional hyperlink.
#### SXTextArea
``` r
SXTextArea(inputId, label = NULL, text = NULL, placeholder = NULL, resizable = TRUE, rows = 5, cols = 40)
```
Add a multiline input, default size = 5 rows, 40px wide.  If cols = '100%' then the input will expand to its parent's width.

