# a) H0 prawdziwa - próbki z rozkładu normalnego
p_wartosci_normalne <- replicate(1000, {
  proba <- rnorm(50)
  shapiro.test(proba)$p.value
})

# b) H0 fałszywa - próbki z rozkładu wykładniczego
p_wartosci_wykladnicze <- replicate(1000, {
  proba <- rexp(50, rate = 1)
  shapiro.test(proba)$p.value
})

# Test Kołmogorowa-Smirnowa dla zgodności z rozkładem jednostajnym [0,1]
ks_normalne <- ks.test(p_wartosci_normalne, "punif")
ks_wykladnicze <- ks.test(p_wartosci_wykladnicze, "punif")

cat("--- H0 prawdziwa (próbki normalne) ---\n")
print(ks_normalne)
cat("\n--- H0 fałszywa (próbki wykładnicze) ---\n")
print(ks_wykladnicze)

# Histogramy p-wartości
par(mfrow = c(1, 2))
hist(p_wartosci_normalne, breaks = 20, freq = FALSE,
     main = "p-wartości (H0 prawdziwa)", xlab = "p", col = "lightblue")
abline(h = 1, col = "red", lwd = 2, lty = 2)

hist(p_wartosci_wykladnicze, breaks = 20, freq = FALSE,
     main = "p-wartości (H0 fałszywa)", xlab = "p", col = "lightgreen")
abline(h = 1, col = "red", lwd = 2, lty = 2)
par(mfrow = c(1, 1))

# Dystrybuanty empiryczne
plot(ecdf(p_wartosci_normalne), col = "blue", lwd = 2,
     main = "Dystrybuanty p-wartości", xlab = "p", ylab = "F(p)")
lines(ecdf(p_wartosci_wykladnicze), col = "red", lwd = 2, lty = 2)
abline(0, 1, col = "black", lty = 3, lwd = 1)
legend("bottomright", legend = c("Normalne (H0 true)", "Wykładnicze (H0 false)", "U(0,1)"),
       col = c("blue", "red", "black"), lty = c(1, 2, 3), lwd = c(2, 2, 1))
