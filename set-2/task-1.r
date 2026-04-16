seed(123)

dane <- rnorm(50, 100, 16)
wartosci <- hist(dane, col = 5, main = "Histogram")
str(wartosci)

stripchart(wartosci$mids, at = 0, pch = 16, add = TRUE)

text(wartosci$mids, wartosci$counts + 1, labels = wartosci$counts, xpd = TRUE)

# średnia próbki
m <- mean(dane)
# średnia szeregu rozdzielczego (pojedynczy słupek)
wm <- weighted.mean(wartosci$mids, wartosci$counts)

# wariancja danych zgrupowanych
var(dane)
sum((dane - m)^2 / (length(dane) - 1)) 

# wariancja danych niezgrupowanych
sum(wartosci$counts * (wartosci$mids - wm)^2) / (length(dane) - 1)

abline(v = m, lwd = 4, col = 2)

# NOTE:
# rysowanie histogramu
# średnia z próbki i szeregu
# wariancja danych zgrupowanych i nie zgrupowanych