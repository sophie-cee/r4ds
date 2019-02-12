library(tidyverse)
library(nycflights13)

planes %>% 
  count(tailnum) %>% 
  filter(n > 1)

weather %>% 
  count(year, month, day, hour, origin) %>% 
  filter(n > 1)

flights2 <- flights %>% 
  mutate(key = row_number())
flights2
glimpse(flights2)

?(Lahman::Batting)

Lahman::Batting %>% 
  count(playerID, yearID, stint) %>% 
  filter(n >1) %>% 
  nrow()

glimpse(babynames::babynames)

install.packages("babynames")

glimpse(nasaweather::atmos)

install.packages("nasaweather")

nasaweather::atmos %>% 
  count(lat, long, year, month) %>% 
  filter(n > 1) %>% 
  nrow()

fueleconomy::vehicles

install.packages("fueleconomy")

glimpse(fueleconomy::vehicles)

fueleconomy::vehicles %>% 
  count(id) %>% 
  filter(n > 1) %>% 
  nrow()

glimpse(ggplot2::diamonds)

ggplot2::diamonds %>% 
  count(x, y, z) %>% 
  filter(n > 1) %>% 
  nrow()

diamonds <- mutate(ggplot2::diamonds, id = row_number())
glimpse(diamonds)

glimpse(Lahman::Managers)
glimpse(Lahman::Master)
glimpse(Lahman::AwardsManagers)

Lahman::Master %>% 
  count(playerID) %>% 
  filter(n > 1)

Lahman::AwardsManagers %>% 
  count(playerID) %>% 
  filter(n > 1)

