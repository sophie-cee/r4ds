library(readr)
Magazine_Subscription_Data <- read_csv("~/Downloads/Magazine Subscription Data.csv")

magsub <- data.frame(Magazine_Subscription_Data)

attach(magsub)

mean(income[ownHome == "ownNo"])
mean(income[ownHome == "ownYes"])

??standarddeviation

sd(income)

t.test(income ~ ownHome)



mean(income[kids <= 2])
mean(income[kids >= 3])

magsub2 <- magsub[kids < 3,]

magsub2

detach(magsub)
attach(magsub2)

t.test(income ~ kids)

