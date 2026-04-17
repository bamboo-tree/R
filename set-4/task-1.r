liczebnosc <- c(62, 57, 70, 58, 59, 67, 65, 69, 55, 57, 60, 54, 72, 66, 74)

# H0: pojemności kondensatorów naleźą do rozkładu normalnego
s_test <- shapiro.test(liczebnosc)
s_test
# p-value > 0.05 - potwierdza to hipotezę H0

qqnorm(liczebnosc)
qqline(liczebnosc)

# szacowanie paramterów z próbki do testu kołmogorowa KS
m <- mean(liczebnosc)
s <- sd(liczebnosc)

ks_test <- ks.test(liczebnosc, "pnorm", m, s)
ks_test
# p-value > 0.05 - potwierdza to hipotezę H0

plot(ecdf(liczebnosc), col = 2)
curve(pnorm(x, m, s), col = 4, add = TRUE)

# NOTE:
# test shapiro pozwala sprawdzić czy próba pochodzi z rozkładu normalnego
# kykresy qq pokazują czy próbka ma rozkład liniowy, dobre do testu shapiro
# szacowanie parametrów m i s do testu KS
# wykres ecdf