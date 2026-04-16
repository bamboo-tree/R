doswiadczenie <- function(m, n) {
  wyniki <- c()
  for (i in 1:n) {
    rzuty <- sample(1:6, m, replace = TRUE)
    probka <- table(factor(rzuty, levels = 1:6))
    test <- chisq.test(probka, p = rep(1 / 6, 6))
    wyniki <- c(wyniki, test$statistic)
  }

  wyniki
}

wynik_doswiadczenia <- doswiadczenie(100, 100)

hist(wynik_doswiadczenia, freq = FALSE, col = "lightblue")
curve(dchisq(x, df = 6 - 1), lwd = 4, col = 3, freq = TRUE, add = TRUE)

krytyczna <- qchisq(1 - 0.05, df = 6 - 1)
abline(v = krytyczna, col = "blue", lwd = 2, lty = 2)


# NOTE:
# stopnie swobody dla rzutu kostką to 6 - 1
# freq = FALSE - wykres gęstości
# wartość krytyczna w chisq to alpha - 1
