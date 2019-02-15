library(tidyverse)
library(forcats)

x1 <- c("Dec", "Apr", "Jan", "Mar")

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

y1 <- factor(x1, levels = month_levels)

y1
sort(y1)

?gss_cat

gss_cat %>% 
  count(race) 
  
gss_cat %>% 
  count(relig) %>% 
  arrange(desc(n)) %>% 
  head(10)


gss_cat %>% 
  count(partyid) %>% 
  arrange(desc(n))

relig_summary <- gss_cat %>% 
  group_by(relig) %>% 
  arrange(desc("tvhours")) %>% 
  summarise(
    age = mean(age, na.rm = T),
    tvhours = mean(tvhours, na.rm = T),
    n = n()
  )

relig_summary

# chapter 16

library(tidyverse)
library(lubridate)
library(nycflights13)

today()

now()

flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_datetime(year, month, day, hour, minute))

s_age <- today() - ymd(19961212)
s_years <- s_age / 365

s_years

