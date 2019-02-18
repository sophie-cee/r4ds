has_name <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep(FALSE, length(x))
  } else {
    !is.na(nms) & nms != ""
  }
}

greet <- function(time = lubridate::now()) {
  hr <- lubridate::hour(time)
  if (hr < 12) {
    print("good morning")
  } else if (hr < 17) {
    print("good afternoon")
  } else {
    print("good evening")
  }
}
greet()

# create a fizzbuzz function. If the number is divisible by three, 
# it returns “fizz”. If it’s divisible by five it returns “buzz”. 
# If it’s divisible by three and five, it returns “fizzbuzz”. 
# Otherwise, it returns the number

fizzbuzz <- function(x) {
  stopifnot(length(x) == 1)
  stopifnot(is.numeric(x))
  if (!(x %% 3) && !(x %% 5)) {
    "fizzbuzz"
  } else if (!(x %% 3)) {
    "fizz"
  } else if (!(x %% 5)) {
    buzz
  } else {
    x
  }
}

fizzbuzz(6)

fizzbuzz(30)

fizzbuzz(2)

?cut()

# how could you use cut() to simplify this:

if (temp <= 0) {
  "freezing"
} else if (temp <= 10) {
  "cold"
} else if (temp <= 20) {
  "cool"
} else if (temp <= 30) {
  "warm"
} else {
  "hot"
}

temperature <- formula(x) {
  if (temp <= 0) {
  "freezing"
  } else if (temp <= 10) {
  "cold"
  } else if (temp <= 20) {
  "cool"
  } else if (temp <= 30) {
  "warm"
  } else {
  "hot"
  }
}