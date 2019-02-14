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
  count(awardID, playerID, yearID) %>% 
  filter(n > 1)

flights2 %>% 
  select(-origin, -dest) %>% 
  left_join(airlines, by = "carrier")
view(flights2)

# joins

airport_locations <- airports %>% 
  select(faa, lat, lon)

flights %>% 
  select(year:day, hour, origin, dest) %>% 
  left_join(airport_locations, by = c("dest" = "faa"))

?planes

plane_age <- planes %>% 
  select(tailnum, year)
flights %>% 
  select(year:day, hour, arr_delay, dep_delay, tailnum) %>% 
  left_join(plane_age, by = "tailnum")

flight_weather <- flights %>% 
  inner_join(weather, by = c(
               "year" = "year",
               "origin" = "origin",
               "month" = "month",
               "day" = "day",
               "hour" = "hour"))

library(viridis)
flights %>% 
  filter(year == 2013, month == 6, day == 13) %>% 
  group_by(dest) %>% 
  summarise(mean_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  inner_join(airports, by = c("dest" = "faa")) %>% 
  ggplot(aes(lon, lat, size = mean_delay, color = mean_delay)) +
  borders("state") +
  geom_point() +
  coord_quickmap() +
  scale_color_viridis()

install.packages("maps")             

?nycflights13

planes_gt100 <- 
  filter(flights) %>% 
  group_by(tailnum) %>% 
  count() %>% 
  filter(n > 100)

flights %>%
  semi_join(planes_gt100, by = "tailnum")

library(fueleconomy)

?fueleconomy::common

fueleconomy::vehicles %>% 
  semi_join(fueleconomy::common, by = c("make", "model"))

