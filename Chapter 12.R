library(tidyverse)

table1
table2
table3
table4a

t2_cases <- filter(table2, type == "cases") %>% 
  rename(cases = count) %>% 
  arrange(country, year)

t2_population <- filter(table2, type == "population") %>% 
  rename(population = count) %>% 
  arrange(country, year)

t2_cases_per_cap <- tibble(
  year = t2_cases$year,
  country = t2_cases$country,
  cases = t2_cases$cases,
  population = t2_population$population
) %>% 
  mutate(cases_per_cap = cases/population * 1000) %>% 
  select(year, country, cases_per_cap)

t2_cases_per_cap <- t2_cases_per_cap %>% 
  mutate(type = "cases_per_cap") %>% 
  rename(count = "cases_per_cap")

bind_rows(table2, t2_cases_per_cap) %>% 
  arrange(year, country, type, count)

table4a
table4b

table4c <- tibble(
  country = table4a$country,
  `1999` = table4a[["1999"]] / table4b[["1999"]] * 10000,
  `2000` = table4a[["2000"]] / table4b[["2000"]] * 10000
)

table4c

table2 %>% 
  filter(type == "cases") %>% 
  ggplot(aes(year, count)) +
  geom_line(aes(group = country), color = "gray") +
  geom_point(aes(color = country)) +
  scale_x_continuous(breaks = unique(table2$year)) + 
  ylab("cases")

# using gather()

tidy4a <- table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")

tidy4b <- table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")

left_join(tidy4a, tidy4b)

newtable2 <- table2 %>% 
  spread(key = type, value = count)
newtable2

library(tidyverse)
stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  spread(year, return) %>% 
  gather("year", "return", `2015`:`2016`)


