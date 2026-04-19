# Zadanie 3 (Własna funkcja + prawo wielkich liczb) - wygenerowane przez AI
# Napisz funkcję avg_cum(x), która zwraca wektor skumulowanych średnich.
#     Wylosuj 1000 liczb z rozkładu U(0, 100).
#     Narysuj wykres skumulowanych średnich.
#     Dodaj poziomą linię dla średniej teoretycznej (50).
#     Powtórz symulację 5 razy na jednym wykresie (różne kolory).
# Sugerowane funkcje: runif, cumsum, seq_along, abline, replicate

avg_cum <- function(x) {
  cumsum(x) / seq_along(x)
}

plot(0, 50, type = "n", xlim = c(0, 1000), ylim = c(0, 100))
abline(h = (100 - 0) / 2, col = 4, lwd = 2)
for (i in c(1, 2, 3, 4, 5)) {
  dane <- runif(1000, min = 0, max = 100)
  x <- avg_cum(dane)
  lines(x, pch = 3, col = i)
}