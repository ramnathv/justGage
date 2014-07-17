## justGage

This is an experimental R package that provides a [justgage](http://justgage.com/) html widget for R. It is more or less a rewrite of the [justgage](http://github.com/jjallaire/justgage) package using the [htmlwidgets](http://github.com/ramnathv/htmlwidgets) package, that reduces the amount of code required considerably by providing generic plumbing to build upon.

### Installation

You can install it from `github`.

```r
library(devtools)
install_github('rstudio/htmltools')
install_github('ramnathv/htmlwidgets')
install_github('ramnathv/justGage')
```

### Usage

Let us first create a simple knob.

```r
library(htmlwidgets)
library(justGage)
k1 = justgage('My Gauge', 20, 0, 100, label = 'New')
k1
```

![knob1](http://i.imgur.com/2wekMlK.png)

We can also use it in a Shiny application.

```r
library(shiny)
library(htmlwidgets)
library(justGage)
ui = bootstrapPage(
  tags$style('body{margin-left:40px; margin-top:40px;}'),
  sliderInput('value', 'Value', 0, 200, 50),
  justgageOutput('live_gauge', width = 250, height = 200)
)
server = function(input, output, session){
  output$live_gauge <- renderWidget(list(
    title = 'My Gauge',
    min = 0,
    value = input$value,
    max = 200
  ))
}

runApp(list(ui = ui, server = server))
```

![knob2](http://i.imgur.com/f9p07hI.png)

### See Also

The `justGage` package makes use of the `htmlwidgets` package that makes it super-simple to package any HTML widget for R. Please read [this](http://github.com/htmlwidgets/blob/master/README.md) to get a better sense on how the `htmlwidgets` package can make your life easier!


#### Credits

This package is highly inspired by the [justgage](http://github.com/jjallaire/justgage) package under development by JJ of [RStudio](http://rstudio.com). I have used several functions from his package, some verbatim, some with minor tweaks, aimed at providing the plumbing required to create HTML widgets with ease. I have also used some code from Winston Chang's `shiny-jsdemo` package on how to bind justgage with Shiny.

