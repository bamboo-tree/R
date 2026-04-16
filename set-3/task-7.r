xi <- 0:5
ni <- c(4, 19, 41, 52, 26, 8)
names(ni) <- xi
ni

# estymowanie parametru p dla rozkładu dwumianowego
p <- weighted.mean(xi, ni) / sum(ni)
n <- 5

# oblicznie prawdopodobienstwa teoretycznego
pr_teor <- c(dbinom(0:5, size = n, prob = p))
pr_teor
sum(pr_teor)

test <- chisq.test(ni, p = pr_teor)
test

if (test$p.value >= 0.05) {
  cat("Test potwierdza hipotezę H0, krowy spełniają rozkład dwumianowy z estymowanym p") # nolint
} else {
  cat("Test odrzuca hipotezę H0, krowy nie spełniają rozkładu swumianowego")
}

# to samo tylko nie estymujemy parametru p
# estymowanie parametru p dla rozkładu dwumianowego
p <- 0.5
n <- 5

# oblicznie prawdopodobienstwa teoretycznego
pr_teor <- c(dbinom(0:5, size = n, prob = p))
pr_teor
sum(pr_teor)

test <- chisq.test(ni, p = pr_teor)
test

if (test$p.value >= 0.05) {
  cat("Test potwierdza hipotezę H0, krowy spełniają rozkład dwumianowy z p = 0.5") # nolint
} else {
  cat("Test odrzuca hipotezę H0, krowy nie spełniają rozkładu dwumianowego")
}

# NOTE:
# rozkład dwumianowy
# estymowanie parametru p