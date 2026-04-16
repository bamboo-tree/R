symuluj_sume <- function(m, n_rysuj = 1) {
  s_m <- numeric(n_rysuj)
  for (j in 1:n_rysuj) {
    x <- runif(m, 0, 1)
    s_m[j] <- sum(x)
    if (n_rysuj == 1) {
      plot(1:m, cumsum(x), type = "l", main = paste("Ścieżka dla m =", m),
           xlab = "k", ylab = "Suma częściowa")
    }
  }
  s_m
}

set.seed(123)
cat("S_100 dla n=1:", symuluj_sume(100, 1), "\n")
cat("S_100 dla n=2:", symuluj_sume(100, 2), "\n")

s_100 <- replicate(100, sum(runif(100, 0, 1)))

par(mfrow = c(1, 2))
hist(s_100, main = "Sumy S_m (m=100, n=100)", xlab = "S_m", col = "lightblue")
s_stand <- (S_100 - 100*0.5) / (sqrt(100 * 1/12))
hist(s_stand, freq = FALSE, main = "Standaryzowane sumy", xlab = "Z", col = "lightgreen")
curve(dnorm(x), col = "red", lwd = 2)
par(mfrow = c(1, 1))
