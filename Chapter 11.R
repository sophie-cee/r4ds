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

