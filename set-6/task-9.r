# Urna zawiera kule z numerami od 1 do 100. Losujemy 10 kul kolejno po jednej kuli bez zwracania i zapisujemy
# numery. Które z poni»szych próbek mo»na uzna¢ za losowe?
# a) 5, 17, 21, 29, 33, 45, 56, 66, 72, 88;
# b) 45, 12, 77, 64, 4, 93, 21, 37, 90, 95;
# c) 63, 90, 47, 16, 86, 74, 97, 13, 26, 3;
# d) 1, 81, 11, 21, 91, 71, 31, 61, 41, 51;
# e) 22, 11, 33, 44, 55, 99, 88, 66, 77, 50

a <- c(5, 17, 21, 29, 33, 45, 56, 66, 72, 88)
b <- c(45, 12, 77, 64, 4, 93, 21, 37, 90, 95)
c <- c(63, 90, 47, 16, 86, 74, 97, 13, 26, 3)
d <- c(1, 81, 11, 21, 91, 71, 31, 61, 41, 51)
e <- c(22, 11, 33, 44, 55, 99, 88, 66, 77, 50)

library("randtests")

# H0: próbka "a" jest losowa
# H1: ~H0
runs.test(a, plot = TRUE)
# p-val = 0.00729 < 0.05 : odrzucamy H0, próbka nie jest losowa

# H0: próbka "b" jest losowa
# H1: ~H0
runs.test(b, plot = TRUE)
# p-val = 1 > 0.05 : przyjmujemy H0, próbka jest losowa

# H0: próbka "c" jest losowa
# H1: ~H0
runs.test(c, plot = TRUE)
# p-val = 0.1797 > 0.05 : przyjmujemy H0, próbka jest losowa

# H0: próbka "d" jest losowa
# H1: ~H0
runs.test(d, plot = TRUE)
# p-val = 0.1797 > 0.05 : przyjmujemy H0, próbka jest losowa

# H0: próbka "e" jest losowa
# H1: ~H0
runs.test(e, plot = TRUE)
# p-val = 0.04417 < 0.05 : odrzucamy H0, próbka nie jest losowa


# NOTE:
# rozkład losowy