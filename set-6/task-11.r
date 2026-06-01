library("randtests")

# Przykład #####################################################################

z <- rnorm(40)
# H0: z ma charakter lososy
# H1: ~H0
runs.test(z, plot = TRUE) # serie nad i pod medianą

x <- c(63, 90, 47, 16, 86, 74, 97, 13, 26, 3)
runs.test(x, plot = TRUE)
# p-val = 0.1797 > 0.05 : przyjmujemy H0

################################################################################

# Wykorzystuj¡c funkcje turning.point.test zbada¢ czy próbka ma charakter losowy
# x2 = c(45, 12, 77, 64, 4, 93, 21, 37, 90, 95)

x2 = c(45, 12, 77, 64, 4, 93, 21, 37, 90, 95)

# H0: x2 ma charakter losowy
# H1: ~H0

turning.point.test(x2)
# p-val = 0.7823 > 0.05 : przymjumjemy H0
runs.test(x2, plot = TRUE)
# jeśli punkty leżą na medianie można użyć threshold do ustawienia lini podziału
# runs.test(x2, plot = TRUE, threshold = 0.5) 

# NOTE:
# test losowości
# charakter losowy próbki