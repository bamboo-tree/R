dane_1 <- rchisq(n = 20, df = 5)
dane_2 <- rchisq(n = 20, df = 5)
dane_3 <- rchisq(n = 20, df = 10)

plot(ecdf(dane_1), col = 2)
plot(ecdf(dane_2), col = 3, add = TRUE)
plot(ecdf(dane_3), col = 4, add = TRUE)