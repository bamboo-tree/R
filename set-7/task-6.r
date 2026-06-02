# Zwerykowa¢ hipotez¦ o równo±ci wariancji pewnej cechy X w dwóch populacjach, tzn. H0 : σ2
# 1 = σ2
# 2 , wobec
# H1 :∼ H0, na podstawie poni»szych próbek
# x1=c(0.93,0.35,1.17,0.6194,1.83,0.706,2.82,1.3,2.91,1.11, 0.226,0.523,0.126,0.31,0.638,2.42, 1.12,1.42,0.27,0.277)
# x2=c(2.57, 0.86, 1.25, 2.39, 1.78, 3.3, 2.828, 3.23, 3.13, 2.37, 2.418, 3.048, 2.595, 0.0397, 0.34, 0.97, 1.924,
# 2.53, 0.358, 0.408, 2.188, 2.89, 0.9997, 0.023, 3.42)

x1 <- c(0.93, 0.35, 1.17, 0.6194, 1.83, 0.706, 2.82, 1.3, 2.91, 1.11, 0.226,
        0.523, 0.126, 0.31, 0.638, 2.42, 1.12, 1.42, 0.27, 0.277)
x2 <- c(2.57, 0.86, 1.25, 2.39, 1.78, 3.3, 2.828, 3.23, 3.13, 2.37, 2.418,
        3.048, 2.595, 0.0397, 0.34, 0.97, 1.924, 2.53, 0.358, 0.408, 2.188,
        2.89, 0.9997, 0.023, 3.42)

# sprawdzamy normalność
shapiro.test(x1)
# p-val < 0.05 rozkład nie jest normalny
shapiro.test(x2)
# p-val < 0.05 rozkład nie jest normalny

# rozkład wartości nie jest normalny, stosujemy test levena
library(lawstat)

gr <- c(rep(1, length(x1)), rep(2, length(x2)))
gr
levene.test(c(x1, x2), gr)
# p-val > 0.05 przyjmujemy H0

# NOTE:
# równość  wariancji
# jeśli dane są z rozkładu normalnego: var.test lub bartlett.test
# jeśli dane nie są z rozkładu normalnego: levene.test