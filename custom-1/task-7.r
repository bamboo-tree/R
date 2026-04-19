# Zadanie 7 (Test Kruskala-Wallisa)
# Masz trzy grupy:
#     Grupa A: rnorm(30, mean=10, sd=2)
#     Grupa B: rnorm(30, mean=12, sd=2)
#     Grupa C: rnorm(30, mean=14, sd=2)
# Sprawdź testem Kruskala-Wallisa, czy różnią się rozkłady.
# Następnie wykonaj testy post-hoc (np. pairwise Wilcoxona z korektą Bonferroniego) i narysuj boxploty.
# Sugerowane funkcje: kruskal.test, pairwise.wilcox.test, boxplot, p.adjust

dane_a <- rnorm(30, mean = 10, sd = 2)
dane_b <- rnorm(30, mean = 12, sd = 2)
dane_c <- rnorm(30, mean = 14, sd = 2)

# H0: rozkłady są do siebie podobne
# H1: rozkładu są do siebie niepodobne

dane <- list(dane_a, dane_b, dane_c)
kruskal.test(dane)
# p-value < 0.05 : można obalić H0, dane mają różne rozkłady

boxplot(dane, col = c(2, 4, 6))