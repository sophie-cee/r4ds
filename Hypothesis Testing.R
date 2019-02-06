library(readxl)
Boston_Clustered <- read_excel("~/Downloads/Boston Clustered.xlsx")
View(Boston_Clustered)

bos <- data.frame(Boston_Clustered)

# instead of using $, attach(x) makes R refer to x variables

attach(bos)

# check out differences in clusters for average number of rooms

mean(rm[cluster==1])
mean(rm[cluster==2])

# check it on a plot

boxplot(rm-cluster)

# use this to determine the dimensions

dim(bos)

# we have 333 datapoints
# runif() will generate x amount of random numbers

rsp <- runif(333)
head(rsp)

# we're randomly dividing up the data set 
# to see if the number of rooms is significantly different

mean(rm[rsp < .5])
mean(rm[rsp >= .5])

# the means are pretty similar
# the difference in the original comparison of means is bigger

# if we want to see if it's statistically significant
# we need to generate it randomly a number of times and
# see how many times it comes out

# let's see if we randomly generate these means thousands
# of times, will the difference be the same as the mean 
# we computed for our clusters?
# doing something repeatedly, use a for loop

stdiff <- rep(0, 10000)
for (i in 1:10000) {
  rsp <- runif(333)
  stdiff[i] <- mean(rm[rsp < .5] - mean(rm[rsp > .5]))
}

# create a histogram

hist(stdiff, breaks = 25)

# quality motors

library(readr)
Quality_Motors <- read_csv("~/Downloads/Quality Motors.csv")
View(Quality_Motors)

qm <- read_csv("~/Downloads/Quality Motors.csv")

qm <- data.frame(qm)

hist(qm$MilesperGallon)
mean(qm$MilesperGallon)

# answer is 28.2

# when we do a ht, we assume the null hypothesis is true
# in this case, our null hypothesis is true mpg = 30

# is the 28.2 a substantial difference or just a coincidence?

# use 30 because our null hypothesis is =30
# use the standard deviation from our sample 

meandist <- rep(0, 10000)
for (i in 1:10000) {
  samp <- rnorm(n = 25, mean = 30, sd = sd(qm$MilesperGallon))
  meandist[i] <- mean(samp) }

# histogram

hist(meandist, breaks = 25)

# proportion of the sample 
sum(sum(meandist < 28.212) + sum(meandist > 31.788))/10000

# p-value = 0.0034, which is less than 0.05. They are 
# cheating

# running the t-test (one-sample)

t.test(qm$MilesperGallon, mu = 30)

# assuming the null hypothesis is true, the chance of 
# us getting the mean we got was 7 / 1000
# Because that probablity is so low, we are going to 
# reject that the true mean is 30

# Hammocks data

library(readr)
Hammocks_Are_Life_1_ <- read_csv("~/Downloads/Hammocks_Are_Life (1).csv")
View(Hammocks_Are_Life_1_)

hl <- read_csv("~/Downloads/Hammocks_Are_Life (1).csv")

h_l <- data.frame(hl)

attach(h_l)


# can not go directly to variables
# we want to look at different variables to see if men
# or women respond differently

# modeling eco importance BY (~) gender
# mu = 0 means that there is no difference
# we're always going to assume two-sided tests

t.test(EcoImportance ~ Gender, mu = 0, 
       alt = "two.sided", conf = .95,
       var.eq = FALSE, paired = FALSE)

unique(Gender)

hl2 <- hl[Gender<4,]

detach(h_l)
attach(hl2)

t.test(EcoImportance ~ Gender)

t.test(HammockUse ~ Gender)

# explore the data

unique(HammockUse)

# stop skewed data

logham <- log(HammockUse + 1)
t.test(logham ~ Gender)