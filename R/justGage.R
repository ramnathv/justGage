#' @export
justGage <- function(title, value, min, max, label = NULL, 
    width = NULL, height = NULL, ...){
  options = list(title = title, value = value, min = min, max = max,
    label = label, width = width, height = height, ...               
  )
  options = Filter(Negate(is.null), options)
  structure(class = c('justGage', 'htmlwidget'), options)
}

#' @export
justgageOutput <- htmlwidgets::widgetOutput('justGage')
