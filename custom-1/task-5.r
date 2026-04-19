# Zadanie 5 (Testy normalności i transformacja)
# Wygeneruj próbkę 80 liczb z rozkładu wykładniczego Exp(rate = 0.2).
#     Wykonaj test Shapiro-Wilka i test Kolmogorowa-Smirnowa (względem rozkładu normalnego z estymowanymi parametrami).
#     Narysuj wykres Q-Q.
#     Zastosuj transformację logarytmiczną i powtórz testy. Czy po transformacji dane są bliższe normalności?
# Sugerowane funkcje: rexp, shapiro.test, ks.test, qqnorm, qqline, log

dane <- rexp(n = 80, rate = 0.2)
dane

# H0: rozkład jest normalny
# H1: rozkład nie jest normalny
test_sh <- shapiro.test(dane)
test_sh
# p-value < 0.05 : można odrzucić H0 rozkład nie jest normalny

ks.test(dane, "pnorm", mean = mean(dane), sd = sd(dane))
# p-value < 0.05 : można odrzucić H0 rozkład nie jest normalny

qqnorm(dane)
qqline(dane)
abline(0, 1, col = 4)

################################################################################

dane_2 <- log(dane)
# H0: rozkład jest normalny
# H1: rozkład nie jest normalny

test_sh <- shapiro.test(dane_2)
test_sh
# p-value > 0.05 : rozkład jest normalny

ks.test(dane_2, "pnorm", mean = mean(dane_2), sd = sd(dane_2))
# p-value > 0.05 : H0 rozkład jest normalny

qqnorm(dane_2)
qqline(dane_2)
abline(0, 1, col = 4)
