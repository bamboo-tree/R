kostka <- c(10, 7, 14, 6, 7, 6)
names(kostka) <- 1:6
kostka

# H0: kostka jest uczciwa, czyli jest równe prawdopodobieństwo
#     wypdadnięcia każdej ścianki

# H1: kostka nie jest uczciwa

# NOTE:
# Jeśli trzeba sprawdzić, czy dany rozkład wartości
# odpowiada konkretnym prawdopodobnieństwom
# (np. kostka dla każdej ścianki ma prawdopodobieństow 1/6)
# wtedy stosujemy chisq.test

test <- chisq.test(kostka, p = rep(1 / 6, 6))
test$p.value

if (test$p.value >= 0.05) {
  cat("Test chisq potwierda H0. Kostka jest uczciwa.")
} else {
  cat("Test chisq odrzuca H0. Kostka nie jest uczciwa.")
}

dane_teoretyczne <- rep(sum(kostka) / 6, 6)
matrix <- rbind(kostka, dane_teoretyczne)

barplot(matrix, col = c(2, 4), beside = TRUE)
