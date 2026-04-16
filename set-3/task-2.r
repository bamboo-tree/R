proporcje_szacowane <- c(4, 8, 2, 1, 1)
prawdopodobienstwo_szacowane <- proporcje_szacowane / sum(proporcje_szacowane)

probka_empiryczna <- c(20, 64, 28, 16, 12)

# H0: Stomatolog ma dobre przeczucie i rozkład prawdopodobieństwa
#     jest zbliżony z jego szacowaniami

# H1: Stomatolog nie ma racji, odrzucamy H0

test <- chisq.test(probka_empiryczna, p = prawdopodobienstwo_szacowane)
test

if (test$p.value >= 0.05) {
  cat("Potwierdzamy H0. Proporcje zabiegów zgadzają się z szacowaniami.")
} else {
  cat("Odrzucamy H0. Proporcje zabiegów nie zgadzają się z szacowaniami.")
}


# jest 16 "próbek" szcowanych i 150 empirycznych, stąd skalowanie
matrix <- rbind(proporcje_szacowane * (150 / 16), probka_empiryczna) # nolint

barplot(matrix, col = c(2, 4), beside = TRUE)
