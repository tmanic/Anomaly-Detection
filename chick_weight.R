library(anomalize)
library(anomaly)
library(tibbletime)
library(dplyr)
view(datasets::ChickWeight)
library(Hmisc)
library(ggplot2)
library(tidyverse)
view(datasets::austres)
dfaustres<-data.frame(austres)
describe(dfaustres)
view(dfaustres)
view(austres)
str(austres)
austres
view(datasets::mtcars)
view(datasets::discoveries)
discoveries.timeseries<-ts(discoveries,start = 1860, end = 1959,frequency = 1)
discoveries.timeseries
plot(discoveries.timeseries)
tidyverse_cran_downloads
tidyverse_cran_downloads_anomalized <- tidyverse_cran_downloads %>%
   time_decompose(count, merge = TRUE) %>%
   anomalize(remainder) %>%
   time_recompose()

tidyverse_cran_downloads_anomalized %>% glimpse()
tidyverse_cran_downloads_anomalized %>%
   plot_anomalies(ncol = 3, alpha_dots = 0.25)
data(FB)
fb<-as_tbl_time(FB, index = date)
fb.timeseries_anomalized<-fb %>%
   time_decompose(volume, merge = TRUE) %>%
   anomalize(remainder) %>%
   time_recompose()
fb.timeseries_anomalized %>% glimpse()
fb.timeseries_anomalized %>%
   plot_anomalies(ncol = 12, alpha_dots = 0.25)
p1<-fb.timeseries_anomalized %>%
   plot_anomaly_decomposition()+
   ggtitle("Freq/Trend = 'auto'")
p1
