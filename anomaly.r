library(anomalize)
library(tibbletime)
library(dplyr)
library(Hmisc)
library(ggplot2)
library(tidyverse)

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
