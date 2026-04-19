# Zadanie 4 (Test niezależności chi-kwadrat)

# Masz tabelę:
# Kolor oczu      niebieski   brązowy
# Włosy jasne     45          15
# Włosy ciemne    30          60

# Sprawdź, czy kolor włosów i oczu są niezależne (α = 0.05).
# Następnie oblicz oczekiwane liczebności i narysuj wykres słupkowy porównujący obserwowane i oczekiwane. # nolint

# Sugerowane funkcje: matrix, chisq.test, barplot, expected

dane <- rbind(
  c(45, 15),
  c(30, 60)
)
colnames(dane) <- c("niebieski", "brązowy")
rownames(dane) <- c("jasne", "ciemne")
dane

# H0: kolor włosów i oczu są NIEZALEŻNE
# H1: kolor włosów i oczu są ZALEŻNE
# test niezależności na macierzy --> chisq.test
test <- chisq.test(dane)
test
# p-value < 0.05 : można odrzucić H0, koloru oczu i włosów są od siebie ZALEŻNE# nolint

par(mfrow = c(1, 2))
mosaicplot(dane, col = c(2, 4))
barplot(dane, beside = TRUE, col = c(2, 4))
par(mfrow = c(1, 1))
