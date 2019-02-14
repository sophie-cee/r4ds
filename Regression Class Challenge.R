library(readr)
Regression_Challenge_Data <- read_csv("~/Downloads/Regression Challenge Data.csv")
# View(Regression_Challenge_Data)

rc <- data.frame(Regression_Challenge_Data)

attach(rc)

rc$day.f <- factor(Day)
rc$hour.f <- factor(Hour)
rc$stars.f <- factor(rc$Stars)

rc.flm <- lm(Rating~stars.f)
summary(rc.flm)

rc.lm <- lm(Rating~stars.f)
summary(rc.lm)

# number 3

rc$dg2 <- DomesticGross^2
dg2

head(rc)

rc.allm <- lm(Rating ~ day.f + hour.f +TrueStory +
                ChickFlick+
                Action +
                TVPremiere +
                ReRun +
                stars.f
                PrevRating+SpotRatings+DomesticGross+dg2)
rc.allm
summary(rc.allm)
names(rc.allm)

plot(DomesticGross, rc.allm$residuals)



library(readr)
Regression_Challenge_Selection_Data <- 
  read_csv("~/Downloads/Regression Challenge Selection Data.csv")

rsel <- data.frame(Regression_Challenge_Selection_Data)
head(rsel)

rsel$Day <- rep("Friday", 20)
rsel$Hour <- rep("9", 20)
rsel$ReRun <- rep(0, 20)

mean(rc$PrevRating)
mean(rc$SpotRatings)

rsel$PrevRating <- rep(2.997536, 20)
rsel$SpotRatings <- rep(15.36271, 20)
rsel$dg2 <- (rsel$DomesticGross)^2

stars.f <- factor(rsel$Stars)
day.f <- factor(rsel$Day)
hour.f <- factor(rsel$Hour)

newrate <- predict(rc.allm, newdata = rsel)

newrate

dim(rc)
dim(rsel)

names(rc)



names(rsel)

pred.adrev <- newrate * 2160000
pred.adrev

pred.net <- pred.adrev - rsel$License.Fee
