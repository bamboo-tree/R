dane <- rchisq(n = 100, d = 10)

h <- hist(dane, xlim = c(0, 30), breaks = 20, col = 4, freq = FALSE)

stripchart(dane, at = 0, pch = 19, col = 2, add = TRUE)

curve(dchisq(x, df = 10), lwd = 4, col = 7, add = TRUE)

abline(v = mean(dane), lwd = 4, col = 8, add = TRUE)
abline(v = median(dane), lwd = 4, col = 9, add = TRUE)

legend(x = "topright", legend = c("mean", "median"), fill = c(8, 9))

# NOTE:
# wykres prawdopodobienstwa chisq
# średnia i mediana
# legenda do wykresu