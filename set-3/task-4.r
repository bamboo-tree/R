xi <- 0:8
ni <- c(14, 31, 47, 41, 29, 21, 10, 5, 2)
names(ni) <- xi
ni

# estymowanie parametru lambda
lambda <- weighted.mean(xi, ni)
lambda

# ze względu na małą liczebność, łączenie ostatnich kolumn
ni <- c(14, 31, 47, 41, 29, 21, 10, 7)
names(ni) <- c(0:6, ">=7")
ni

# wyznaczenie prawdopodobienstwa teoretycznego
pr_teor <- c(dpois(c(0:6), lambda), ppois(6, lambda, lower.tail = FALSE))
pr_teor
sum(pr_teor)

# test chi-kwadrat, sprawdzenie czy liczebność danych z próbki
# zgadza się z prawdopodobieństwem teoretycznym
test <- chisq.test(ni, p = pr_teor)

if (test$p.value >= 0.05) {
  cat("Potwierdzamy hipotezę H0: liczba klientów w ciągu minuty ma rozkład poissona") # nolint
} else {
  cat("Odrzucamy hipotezę H0")
}

# połączenie danych do wyświetlenia w barplot
matrix <- rbind(test$observed, test$expected)
barplot(matrix, beside = TRUE, col = c(2, 4))

# NOTE:
# rozkład poissona
# prawdopodobienstwo teoretyczne i empiryczne
# test chisq
