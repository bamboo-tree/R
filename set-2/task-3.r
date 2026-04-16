dane <- runif(n = 60, min = 50, max = 100)

h <- hist(dane, xlim = c(50, 100), col = 5, breaks = 12)

stripchart(dane, add = TRUE, at = 0, col = "red", pch = 19)

text(h$mids, h$counts + 0.2, label = h$counts)


# NOTE:
# stripchart - pozwala na rysowanie wykresu "kropkowego" na małych zbiorach
#              danych przydatne np w histogramie dla liczebności próbek