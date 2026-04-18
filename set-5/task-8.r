dane <- read.csv("set-5/miasta.csv", sep = ";", fileEncoding = "Windows-1250")
head(dane)

plot(dane$pow, dane$lud)

# H0: powierzchnia miasta i liczba ludności są niezależne
# H1: istnieje zależność między powierzchnią a liczbą ludności

summary(dane$pow)
summary(dane$lud)
range(dane$pow, na.rm = TRUE)
range(dane$lud, na.rm = TRUE)

granice_pow <- c(0, 50, 100, 600)
pow <- cut(dane$pow, breaks = granice_pow)

granice_lud <- c(0, 50000, 200000, 1800000)
lud <- cut(dane$lud, breaks = granice_lud)

tab <- table(pow, lud)
tab

abline(v = granice_pow, col = 2)
abline(h = granice_lud, col = 3)

chisq.test(tab)
# p-value < 0.05 - powierzchnia miasta i liczba ludności są niezależne