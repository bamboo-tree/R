# Symulacja liczby serii, n- liczba symulacji, m- wielko±¢ próbki.
# Wylosowa¢ m liczb z rozkªadu jednostajnego U (0, 1). Zbada¢ losowo±¢ wygenerowanych danych i zliczy¢
# liczb¦ serii. Powtórzy¢ procedur¦ n razy. Wykorzysta¢ funkcj¦ replicate( ). Rozpatrzy¢ przypadki: (I) n =
# 1000, m = 1000; (II) n = 5000, m = 1000. Zbada¢ zgodno±¢ danych z punktu (I) z rozkªadem normalnym.

# AI generated*

runs_count <- function(binary_vec) {
  if(length(binary_vec) == 0) return(0)
  sum(diff(binary_vec) != 0) + 1
}

simulate_runs <- function(n, m) {
  replicate(n, {
    sample <- runif(m)
    binary <- ifelse(sample > 0.5, 1, 0)
    runs_count(binary)
  })
}

set.seed(123)

wyniki_I <- simulate_runs(1000, 1000)
wyniki_II <- simulate_runs(5000, 1000)

shapiro.test(wyniki_I)
# p-val > 0.05 : rozkład normalny

par(mfrow=c(1,2))
hist(wyniki_I, breaks=30, probability=TRUE, main="n=1000, m=1000")
curve(dnorm(x, mean(wyniki_I), sd(wyniki_I)), add=TRUE, col="blue", lwd=2)
qqnorm(wyniki_I)
qqline(wyniki_I, col="red")
par(mfrow=c(1,1))

# NOTE:
# symulacja serii liczb