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


## WORK ON THIS

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)

# what are the variables?
# sex, pregnant, count
# value = "count" for integers

preg_tidy <- preg %>% 
gather(male, female, key = "sex", value = "count")

preg_tidy

table3 %>% 
separate(rate, into = c("cases", "population"), convert = TRUE)

table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)

table5 %>% 
  unite(new, century, year, sep = "")

?separate()

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"), extra = "drop")

tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
  separate(x, c("one", "two", "three"), fill = "right")

?unite()
?separate
?extract()

tibble(variable = c("X", "X", "Y", "Y"), id = c(1, 3, 4, 2)) %>%
  unite(x, variable, id, sep = "_")

stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)

stocks %>% 
  spread(year, return) %>% 
  gather(year, return, `2015`:`2016`, na.rm = TRUE)

?gather

stocks %>% 
  complete(year, qtr)

treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)

treatment %>% 
  fill(person)

?spread()

?complete()

?fill()

# WHO case study

view(who)

# some columns seem to be variables

who1 <- who %>% 
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = T)

who1

# count values in "key" (unknown variable)

who1 %>% 
  count(key)

who2 <- who1 %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
who2

who3 <- who2 %>% 
  separate(key, into = c("new", "type", "sex"), sep = "_")
who3

who4 <- who3 %>% 
  select(-new, -iso2, -iso3)
who4

who5 <- who4 %>% 
  separate(sex, into = c("sex", "age"), sep = 1)
who5

