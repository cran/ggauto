## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 8,
  out.width = "100%"
)

## ----setup--------------------------------------------------------------------
library(ggauto)

## ----warning=FALSE------------------------------------------------------------
library(ggplot2)

## -----------------------------------------------------------------------------
mpg |>
  ggauto(displ)

## -----------------------------------------------------------------------------
ggauto(mpg, displ)

## -----------------------------------------------------------------------------
ggauto(mpg$displ)

## ----fig.height=6-------------------------------------------------------------
mpg |>
  ggauto(drv, displ)

## ----fig.height=6-------------------------------------------------------------
economics |>
  ggauto(date, unemploy)

## ----fig.height=6-------------------------------------------------------------
txhousing |>
  dplyr::filter(city %in% c("Houston", "Fort Worth", "San Antonio", "Austin")) |>
  dplyr::mutate(date = lubridate::ymd(paste0(year, "/", month, "/01"))) |>
  ggauto(date, sales, city)

## ----fig.height=6-------------------------------------------------------------
txhousing |>
  dplyr::filter(city %in% c(
    "Houston", "Fort Worth", "San Antonio", "Austin",
    "Bay Area", "Dallas", "Paris", "San Angelo"
  )) |>
  dplyr::mutate(date = lubridate::ymd(paste0(year, "/", month, "/01"))) |>
  ggauto(date, sales, city)

## -----------------------------------------------------------------------------
diamonds |>
  ggauto(cut)

## -----------------------------------------------------------------------------
diamonds |>
  dplyr::group_by(cut) |>
  dplyr::summarise(median_price = median(price)) |>
  ggauto(cut, median_price)

## -----------------------------------------------------------------------------
diamonds |>
  dplyr::group_by(cut) |>
  dplyr::summarise(median_price = median(price)) |>
  dplyr::mutate(cut = as.character(cut)) |>
  ggauto(cut, median_price)

## ----fig.height=8-------------------------------------------------------------
mpg |>
  dplyr::mutate(cyl = as.character(cyl)) |>
  ggauto(cyl, drv)

## ----fig.height=6-------------------------------------------------------------
mpg |>
  dplyr::mutate(cyl = as.character(cyl)) |>
  ggauto(trans, cyl)

## ----fig.height=6-------------------------------------------------------------
mpg |>
  dplyr::mutate(cyl = as.factor(cyl)) |>
  ggauto(trans, cyl)

## ----fig.height=8-------------------------------------------------------------
mpg |>
  dplyr::mutate(cyl = as.character(cyl)) |>
  dplyr::group_by(cyl, drv) |>
  dplyr::summarise(mean_hwy = mean(hwy), .groups = "drop") |>
  ggauto(cyl, drv, mean_hwy)

## ----error=TRUE---------------------------------------------------------------
try({
mpg |>
  dplyr::mutate(cyl = as.character(cyl)) |>
  ggauto(cyl, drv, hwy)
})

## ----fig.height=6-------------------------------------------------------------
mpg |>
  ggauto(displ, hwy)

## ----fig.height=6-------------------------------------------------------------
mpg |>
  dplyr::mutate(cyl = as.factor(cyl)) |>
  ggauto(displ, hwy, cyl)

## ----fig.height=8-------------------------------------------------------------
mpg |>
  dplyr::mutate(cyl = as.factor(cyl)) |>
  ggauto(displ, hwy, manufacturer)

## -----------------------------------------------------------------------------
set.seed(123)
plot_data <- data.frame(
  v1 = rnorm(50, 1)
)

## ----fig.height=5-------------------------------------------------------------
ggauto(plot_data, v1) +
  scale_x_continuous()

## ----fig.height=5-------------------------------------------------------------
plot_data |>
  ggauto(v1,
    title = "Descriptive title goes here",
    subtitle = "More information about what's in the chart which can be a really, really long sentence that will wrap onto multiple lines automatically.",
    caption = "**Source**: where the data is from",
    xlab = "Nice variable name"
  )

