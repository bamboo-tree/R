dane <- rchisq(n = 15, df = 10)

# wykres dystrybuanty empirycznej
plot(ecdf(dane), main = "Dystrybuanta empiryczna i teoretyczna χ²(10)",
     xlab = "x", ylab = "F(x)", col = "blue", lwd = 2)

# wykres dystrybuanty teoretycznej
curve(pchisq(x, df = 10), add = TRUE, col = "red", lwd = 2, lty = 2)

# wykres próbki
stripchart(dane, add = TRUE, at = 0, col = "darkgreen", pch = 19)


dane <- rchisq(m = 100, df = 10)
plot(ecdf(dane), main = "Dystrybuanta empiryczna i teoretyczna",
     xlab = "x", ylab = "F(x)", col = 4, lwd = 2)
curve(pchisq(x, df = 10), add = TRUE, col = 5, lwd = 2, lty = 2)

# NOTE:
# dystrybuanta empiryczna - ecdf
# dystrybuanta teoretyczna
# wykres próbki