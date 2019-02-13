library(readr)
Regression_Challenge_Data <- read_csv("~/Downloads/Regression Challenge Data.csv")
View(Regression_Challenge_Data)

rc <- data.frame(Regression_Challenge_Data)

attach(rc)

day.f <- factor(Day)
hour.f <- factor(Hour)

s0 <- Stars == 0
s1 <- Stars == 1
s2 <- Stars == 2
s3 <- Stars == 3

rc.flm <- lm(Rating~s1+s2+s3)
summary(rc.flm)

rc.lm <- lm(Rating~Stars)
summary(rc.lm)

# number 3

rc.allm <- lm(Rating ~ 
                day.f + 
                hour.f +
                TrueStory +
                ChickFlick+
                Action +
                TVPremiere +
                ReRun +
                s1 +
                s2 +
                s3 +
                PrevRating +
                SpotRatings +
                DomesticGross +
                dg2
                )
rc.allm
summary(rc.allm)
names(rc.allm)

plot(DomesticGross, rc.allm$residuals)

dg2 <- DomesticGross^2
dg2

