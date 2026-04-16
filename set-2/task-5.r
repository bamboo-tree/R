dane <- read.csv2(file = "dane.csv", header = TRUE, sep = ",", dec = ".")

ncol(dane)
nrow(dane)
str(dane)

dane2 <- dane[c("hgt", "sex")]
head(dane2)

kobiety <- subset(dane2, sex == 0)
mezczyzni <- subset(dane2, sex == 1)

par(mfrow = c(1, 3))
hist(kobiety$hgt, col = 3)
hist(mezczyzni$hgt, col = 2)
hist(kobiety$hgt, col = 3)
hist(mezczyzni$hgt, col = 2, add = TRUE)
par(mfrow = c(1, 1))
