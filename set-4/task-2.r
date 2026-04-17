probka <- c(55.1, 67.3, 54.6, 52.2, 58.4, 50.4, 70.1, 55.3, 57.6, 62.5, 65.2,
            68.4, 54.5, 56.7, 53.5, 61.6, 59.6, 49.0, 63.7, 58.1, 56.7, 57.8,
            63.6, 69.2, 60.8, 62.9, 54.3, 61.0, 58.2, 64.3, 57.4, 39.3, 59.0,
            60.1, 60.7, 59.9, 70.5, 57.2, 61.8, 46.0)

# H0: rozkład maksymalnej pojemności kondensatorów jest normalny

s_test <- shapiro.test(probka)
s_test
# p-value > 0.05 - potwierdza to hipotezę H0

qqnorm(probka)
qqline(probka)

# H1: rozkład maksymalnej pojemnosci kondenstatorów jest normalny o średniej 60
#     i wariancji 2.5

m <- 60
sd <- 2.5

ks_test <- ks.test(probka, m, sd)
ks_test
# p-value > 0.05 - potwierdza to hipotezę H1

plot(ecdf(liczebnosc), col = 2)
curve(pnorm(x, m, sd), col = 4, add = TRUE)

# NOTE:
# test shapiro, test ks