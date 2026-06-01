# Wykorzystuj¡c funkcje:
# • runs.test, • turning.point.test, • bartels.rank.test
# z pakietu randtests zbada¢, które z poni»szych próbek mo»na uzna¢ za losowe.
# a) p1 = c(1, 2, 3, 12, 14, 6, 7, 8, 9, 10, 11, 12, 20, 14, 25, 6, 8, 30);
# b) p2 = c(3, 4, 1, 12, 14, 6, 7, 19, 9, 10, 11, 12, 20, 14, 25, 6, 8, 26, 16, 10, 21, 12);
# c) p3 = c(2, 19, 3, 24, 10, 11, 17, 9, 1, 16, 15, 16, 28, 14, 30, 8, 26, 3, 12, 33, 4, 24, 15, 16);
# d) p4 = c(10, 9, 11, 12, 7, 8, 11, 13, 12, 15, 13, 10, 14, 15, 18, 13, 16, 10, 8, 9, 10, 11, 13, 12, 17, 14, 12, 20, 15, 11, 12);
# e) p5 = c(0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)

library("randtests")

p1 = c(1, 2, 3, 12, 14, 6, 7, 8, 9, 10, 11, 12, 20, 14, 25, 6, 8, 30)
p2 = c(3, 4, 1, 12, 14, 6, 7, 19, 9, 10, 11, 12, 20, 14, 25, 6, 8, 26, 16, 10, 21, 12)
p3 = c(2, 19, 3, 24, 10, 11, 17, 9, 1, 16, 15, 16, 28, 14, 30, 8, 26, 3, 12, 33, 4, 24, 15, 16)
p4 = c(10, 9, 11, 12, 7, 8, 11, 13, 12, 15, 13, 10, 14, 15, 18, 13, 16, 10, 8, 9, 10, 11, 13, 12, 17, 14, 12, 20, 15, 11, 12)
p5 = c(0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)

# H0: p1 ma charakter losowy
# H1: ~H0
runs.test(p1, plot = TRUE)
# p-val = 0.05194 > 0.05 : brak podstaw do odrzucenia H0
turning.point.test(p1)
# p-val = 0.005943 < 0.05 : odrzucamy H0
bartels.rank.test(p1)
# p-val = 0.03419 odrzucamy H0

# H0: p1 ma charakter losowy
# H1: w próbce p1 występuje trend
bartels.rank.test(p1, alternative = "left.sided")
# statistic = -2.1178, n = 18, p-value = 0.01709
# alternative hypothesis: trend
# p-val = 0.01709 < 0.05 : odrzucamy H0

# H0: p1 ma charakter losowy
# H1: występują oscylacje między dużymi i małymi wartościami
bartels.rank.test(p1, alternative = "right.sided")
# statistic = -2.1178, n = 18, p-value = 0.9829
# alternative hypothesis: systematic oscillation
# p-val = 0.9829 > 0.05 : nie ma podstaw do odrzucenia H0

# JEŚLI WYJDZIE ŻE JEST LOSOWA NIE TRZEBA SPRAWDZAĆ TRENDÓW ANI OSCYLACJI

# zastosowanie threshold #######################################################

# H0: p5 ma rozkład losowy
# H1: ~H0
runs.test(p5, plot = TRUE, threshold = 0.5)
# p-val = 0.6164 brak podstaw do odrzucenia H0
bartels.rank.test(p5)

# NOTE:
# test losowości