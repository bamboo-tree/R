w_1 <- c(176, 182.5, 166, 175, 175.5, 161.5, 173, 165, 186, 170.5, 158, 163.5)
w_2 <- c(168, 172, 163, 171.5, 177, 190, 172.5, 164, 183.5, 171, 157.5, 166)

# H0: studenci mają taki sam rozkład wzrostu na 1 i 2 roku
test <- ks.test(w_1, w_2)
test
# p-val > 0.05 - potwierdza to hipotezę H0

# wykres emiprycznego rozkładu próbek
plot(ecdf(w_1), col = 2)
lines(ecdf(w_2), col = 4)

# porównanie próbek na wykresie qq
qqplot(w_1, w_2, lwd = 5, asp = 1, col = 4)
abline(0, 1)

# NOTE:
# test ks pozwala sprawdzić czy dwie próbki mają taki sam rozkład