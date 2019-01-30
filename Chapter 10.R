library(tidyverse)
library(magrittr)
library(nycflights13)

df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

df$x

df[["x"]]

df$y
df[[1]]

df %>% .$x

df$x

mtcars

# convert to a tibble

as_tibble(mtcars)

data.frame(mtcars)

df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[,c("abc", "xyz")]

tbl <- as_tibble(df)
tbl$x
tbl[, "xyz"]
tbl[,c("abc", "xyz")]


annoying <- tibble(
  `1` = 1:10,
  `2` = `1` * 2 + rnorm(length(`1`))
)

annoying[["1"]]

ggplot(annoying, aes(x = `1`, y = `2`)) +
  geom_point()

annoying <- annoying %>% 
  mutate( `3` = (`2`/`1`))

annoying <- 
  rename(annoying, 
         one = `1`,
         two = `2`,
         three = `3`
         )

glimpse(annoying)

?tibble::enframe

