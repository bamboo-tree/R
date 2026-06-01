# Wykorzystuj¡c funkcje:
# • runs.test, • turning.point.test,
# z pakietu randtests zbada¢ czy próbka ma charakter losowy
# x = c(−1, 1, 3, −1, 1, −1, 1, −1, 2, 1, −1, 1, −1, 1, −1, 1, −1, 1, 5, −1, 3)

library("randtests")

x = c(−1, 1, 3, −1, 1, −1, 1, −1, 2, 1, −1, 1, −1, 1, −1, 1, −1, 1, 5, −1, 3)

# H0: dane mają charakter losowy
# H1: ~H0
runs.test(x, plot = TRUE)
# p-val = 0.1797 > 0.05 : można przyjąć H0

# H0: dane mają charakter losowy
# H1: ~H0
turning.point.test(x)
# p-val = 0.1671 > 0.05 : można przyjąć H0

# NOTE:
# test losowości
# charakter losowy