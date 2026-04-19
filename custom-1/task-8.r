# Zadanie 8 (Porównanie dystrybuant empirycznych)
# Wygeneruj dwie próbki:
#     x1 – 50 liczb z N(0,1)
#     x2 – 50 liczb z N(0.5, 1.5)
# Narysuj na jednym wykresie dystrybuanty empiryczne obu próbek (ecdf).
# Następnie wykonaj test Kolmogorowa-Smirnowa porównujący te dwie próbki. Zinterpretuj wynik.
# Sugerowane funkcje: ecdf, plot, lines, ks.test

x1 <- rnorm(n = 50, mean = 0, sd = 1)
x2 <- rnorm(n = 50, mean = 0.5, sd = 1.5)
x1
x2

plot(ecdf(x1), col = 2)
plot(ecdf(x2), col = 4, add = TRUE)

# H0: próbki są do siebie podobne i mają zbliżony rozkład
# H1: próbki są do siebie niepodobne ponieważ mają różny rozkład
ks.test(x1, x2)
# p-value > 0.05 - można potwierdzić H0