library(tidyverse)

heights <- read_csv("data/heights.csv")

read_csv("a, b, c
         1, 2, 3
        4, 5, 6", col_names = FALSE)

read_csv("1, 2, 3
         4, 5, 6", col_names = c("x", "y", "z"))

?read_csv
?read_tsv
?read_fwf
?read_delim

# the following is out of date

x <- "x,y\n1,'a,b'"
read_delim(x, ",", quote = "'")

# current solution

read_csv(x, quote = "'")

read_csv("a,b,.\n1,2,3\n4,5,6")

read_csv("a,b,c, \n1,2, , \n1,2,3,4", na = c(" "))

read_csv("a,b\n\"1")

read_csv("a,b\n1,2\na,b")

read_csv2("a;b\n1;3")

parse_integer(c("1", "231", ".", "456"), na = ".")

fruit <- c("apple", "banana")
parse_factor(c("apple", "banana", "bananana"), levels = fruit)

install.packages(hms)

?locale()

parse_double("1,23", locale = locale(decimal_mark = ",", 
             grouping_mark = ","))

parse_date(("1 augusti 2017"), locale("sv", "%d/%B/%Y"))

d1 <- "January 1, 2010"
parse_date(d1, "%B %d, %Y")

d2 <- "2015-Mar-07"
parse_date(d2, "%Y-%b-%d")

d3 <- "06-Jun-2017"
parse_date(d3, "%d-%b-%Y")

d4 <- c("August 19 (2015)", "July 1 (2015)")
parse_date(d4, "%B %d (%Y)")

d5 <- "12/30/14"
parse_date(d5, "%m/%d/%y")

t1 <- "1705"
parse_time(t1, "%H%M")

t2 <- "11:15:10.12 PM"
parse_time(t2, "%H:%M:%OS %p")

# SRC workshop 1

install.packages(readxl)

provo_highs <- c(83, 91, 96, 94, 89, 85, 84)
slc_highs <- c(80, 85, 95, 89, 82, 77, 81)

mean_provo_highs <- mean(provo_highs)

median(provo_highs)
range(provo_highs)
range(slc_highs)

length(provo_highs)

?length

mean_slc_highs <- mean(slc_highs)
average_diff <- (mean_provo_highs - mean_slc_highs)
average_diff

library(tidyverse)

write_csv(mtcars, "mtcars.csv")

d <- read_csv("mtcars.csv")

names(d)
summary(d)

head(d)

tail(d)

str(d)

d$am <- as.factor(d$am)
str(d$am)

?tapply()

install.packages("psych")
library(psych)

tapply(d$mpg, d$gear, mean)

sapply(d, mean)

describe(d$hp)

addmargins(table(d$carb, d$am, dnn = c("# of Carburetors","Transmission")))

hist(d$wt, col = "orange", xlab = NA, main = "Distribution of Weight", border = "red")

boxplot(d$mpg, d$gear)

d$gear <- as.factor(d$gear)

str(d$gear)

describeBy(d$mpg, d$am) 


# Workshop 2

library(tidyverse)
library(magrittr) # for %<>% pipe
write_csv(mtcars, "mtcars.csv")
d <- read_csv("mtcars.csv")
d1 <- read_csv("carid.csv")
d2 <- read_csv("cqi.csv")
d <- cbind(d, d1, d2)
d$wt <- d$wt*1000
d %<>% select(carID, mpg, everything())

library(psych)

packageDescription("psych")

?psych

browseVignettes(package = "psych")

?ggplot2

?tidyverse

vignette(package = "ggplot2")

vignette("ggplot2-specs")

install.packages("Hsmisc")

library(psych)
library(Hmisc)
describe(d$mpg)

Hmisc::describe(d$mpg)

psych::describe(d$mpg)


#####

library(tidyverse)
x <- parse_integer(c("123", "345", "abc", "123.45"), na = ".")

problems(x)

str(heights)

