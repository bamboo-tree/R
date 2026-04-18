dane <- read.csv("set-5/powiaty.csv", sep = ";", fileEncoding = "Windows-1250")
head(dane)

plot(dane$pow, dane$lud)

# H0: powierzchnia powiatu jest zależna od liczy ludności

summary(dane$pow)
granice_pow <- c(0, 600, 1200, 3000)
pow <- cut(dane$pow, breaks = granice_pow)

summary(dane$lud)
granice_lud <- c(19900, 50000, 80000, 2000000)
lud <- cut(dane$lud, breaks = granice_lud)

tab <- table(pow, lud)
tab

abline(v = granice_pow, col = 2)
abline(h = granice_lud, col = 3)

chisq.test(tab)
# p-val < 0.05 : odrzucamy H0