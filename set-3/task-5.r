xi <- 0:7
ni <- c(4, 6, 16, 12, 7, 2, 0, 1)

# obliczanie lambdy
lamb <- weighted.mean(ni, xi)
lamb

# ze względu na małą ilość danych trzeba zgrupować ostatnie kolumny
ni <- c(4, 6, 16, 12, 10)
names(ni) <- c(0:3, ">=4")
ni

# obliczenie prawdopodobienstwa teoretycznego
pr_teor <- c(dpois(0:3, lamb), ppois(3, lamb, lower.tail = FALSE))
pr_teor
sum(pr_teor)

test <- chisq.test(ni, p = pr_teor)
test

if (test$p.value >= 0.05) {
  cat("Potwierdzamy hipotezę H0: liczba zdobytych goli podczas meczu ma rozkład poissona") # nolint
} else {
  cat("Odrzucamy hipotezę H0")
}

m2 <- rbind(test$observed, test$expected)
barplot(m2, beside = TRUE, col = c(2, 4))

# NOTE:
# rozkład poissona
# prawdopodobienstwo teoretyczne i empiryczne
# test chisq