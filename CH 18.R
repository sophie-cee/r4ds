library(magrittr)

foo_foo <- little_bunny()

foo_foo_1 <- hop(foo_foo, through = forest)
foo_foo_2 <- scoop(foo_foo_1, scoop = field_mice)
foo_foo_3 <- bop(foo_foo_2, on = head)

x <- c(1:10, Inf)
rescale01(x)

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  y <- (x - rng[1]) / (rng[2] - rng[1])
}
y[y == -Inf] <- 0
y[y == Inf] <- 1
y

z <- rescale01(c(Inf, -Inf, 0:5, NA))
z

prop_na <- function(x) {
  mean(is.na(x))
} 
prop_na(c(0,1,2,NA,4,NA))

x / sum(x, na.rm = TRUE)

# x is the input

sum_to_one <- function(x, na.rm = FALSE) {
  x / sum(x, na.rm = na.rm)
}

sum_to_one(1:5)

sum_to_one(c(1:5, NA))

sum_to_one(c(1:5, NA), na.rm = T)

sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)

coef_variation <- function(x, na.rm = FALSE) {
  sd(x, na.rm = na.rm) / mean(x, na.rm = na.rm) 
}

coef_variation(1:5)

?substr
