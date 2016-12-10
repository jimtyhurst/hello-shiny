# hello-shiny

Simple example of a web application written in [R](https://www.r-project.org/), using the [Shiny](https://shiny.rstudio.com/) framework. This code is from [a Shiny tutorial](https://shiny.rstudio.com/articles/build.html). It displays a boxplot for data from R's [mtcars](http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html) dataset. There are a couple of UI widgets to control the diagram. See a screen shot in [docs/mpg-screenshot.png](https://github.com/jimtyhurst/hello-shiny/blob/master/docs/mpg-screenshot.png).

To run the web app in an R session from the root directory of the project, using the default `runApp` parameters:

```
library(shiny)
shiny::runApp()

Listening on http://127.0.0.1:4304
```

See [`shiny::runApp` documentation](https://shiny.rstudio.com/reference/shiny/latest/runApp.html) for options for running the web application, including setting the `appDir`, `host`, or `port` parameters:

```
?shiny::runApp
```
