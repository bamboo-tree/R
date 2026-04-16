x <- seq(50, 150, 0.1)

par(mfrow = c(2, 3))

curve(dnorm(x, mean = 100, sd = 16), from = 50, to = 150, xlab = "argumenty",
      ylab = "wartości", main = "Normalny, m = 100, s = 16")

curve(dunif(x, min = 0, max = 1), from = -0.5, to = 1.5, xlab = "argumenty",
      ylab = "wartości", main = "Jednostajny, a = 0, b = 1")

curve(dexp(x, rate = 1), from = 0, to = 20, xlab = "argumenty",
      ylab = "wartości", main = "Wykładniczy, lambda = 1")

curve(dchisq(x, df = 2), from = 0, to = 10, xlab = "argumenty",
      ylab = "wartości", main = "Chi-kwadrat, df = 2")

x_pois <- 0:20
y_pois <- dpois(x_pois, lambda = 7)
plot(x_pois, y_pois, type = "h", xlim = c(0, 20), xlab = "argumenty",
     ylab = "wartości", main = "Poisson, lambda = 7")

x_binom <- 0:20
y_binom <- dbinom(x_binom, size = 20, prob = 0.5)
plot(x_binom, y_binom, type = "h", xlim = c(0, 20), xlab = "argumenty",
     ylab = "wartości", main = "Poisson, lambda = 7")

par(mfrow = c(1, 1))

# NOTE:

# gęstości rozkładu normalnego -> liniowy
# gęstości rozkładu jednostajnego -> liniowy
# gęstości rozkładu wykładniczego -> liniowy
# gęstości rozkładu chi-kwadrat -> liniowy
# prawdopodobieństwa rozkładu poissona -> słupkowy (pionowe linie)
# prawdopodobieństwa rozkładu dwumianowego -> słupkowy (pionowe linie)