liczebnosc <- c(10, 18, 28, 18, 12)
names(liczebnosc) <- c("< 35", "35 - 45", "45 - 55",  "55 - 65",  "> 65")
liczebnosc

m <- 50
sigma <- 15

granica <- c(-Inf, 35, 45, 55, 65, Inf)
f_35 <- pnorm(35, m, sigma)   # F (35)
f_45 <- pnorm(45, m, sigma)   # F (45)
f_35_45 <- f_45 - f_35        # F (45) - F (35) <==> P(35 <= x <= 45)
f_35_45

diff(pnorm(c(35, 45), m, sigma)) # to samo co wyżej

# policzenie prawdopodobienstwa teoretycznego dla wszystkich przedziałów
pr_teor <- diff(pnorm(granica, m, sigma))
pr_teor

chisq.test(liczebnosc, p = pr_teor)

# NOTE:
# badanie rozkładu normalnego
# wyznaczanie prawdopodobienstwa na przedziałach - diff, pnorm
