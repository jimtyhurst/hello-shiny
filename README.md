# hello-shiny

Simple example of a web application written in [R](https://www.r-project.org/), using the [Shiny](https://shiny.rstudio.com/) framework. This code is originally from [a Shiny tutorial](https://shiny.rstudio.com/articles/build.html).

See shiny::runApp options for running the web application, including the `appDir`, `host`, and `port` parameters:

```
> ?shiny::runApp
```

To run the web app in an R session from the root directory of the project:

```
> library(shiny)
> shiny::runApp()

Listening on http://127.0.0.1:4304
```

The application displays in a web browser, showing a boxplot for data from R's [mtcars](http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html) dataset. There are a couple of UI widgets to control the diagram.
