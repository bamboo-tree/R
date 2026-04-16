skumulowane_srednie <- function(wektor) {
  cumsum(wektor) / seq_along(wektor)
}

pwl_symulacja <- function(m = 100, n = 5) {
  plot(1:m, type = "n", xlim = c(1, m), ylim = c(0, 100),
       xlab = "n", ylab = "Średnia skumulowana", main = "Prawo wielkich liczb")
  for (i in 1:n) {
    proba <- runif(m, 0, 100)
    s_srednie <- skumulowane_srednie(proba)
    lines(1:m, s_srednie, col = i, lwd = 1.5)
  }
  abline(h = 50, col = "black", lwd = 2, lty = 2)
}

set.seed(123)
pwl_symulacja(m = 100, n = 10)

# NOTE:
# prawo wielkich liczb
# skumulowane średnie