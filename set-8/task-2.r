# Spo±ród uczniów pewnego liceum wylosowano 15 z klas pierwszych i 12 z klas drugich i obliczono ich ±redni¡
# ocen
# Klasa1 = c(3.71, 4.28, 2.95, 3.20, 3.38, 4.05, 4.07, 4.98, 3.20, 3.43, 3.09, 4.50, 3.12, 3.68, 3.90)
# Klasa2 = c(3.10, 3.38, 4.06, 3.60, 3.81, 4.50, 4.00, 3.25, 4.11, 4.85, 2.80, 4.00).
# Zwerykowa¢ hipotez¦ H0, »e ±rednie ocen w klasach pierwszych i drugich s¡ takie same.

k1 = c(3.71, 4.28, 2.95, 3.20, 3.38, 4.05, 4.07, 4.98, 3.20, 3.43, 3.09, 4.50, 3.12, 3.68, 3.90)
k2 = c(3.10, 3.38, 4.06, 3.60, 3.81, 4.50, 4.00, 3.25, 4.11, 4.85, 2.80, 4.00)

# test normalności
shapiro.test(k1)
shapiro.test(k2)
# dane pochodzą z rozkładu normalnego

# test równości wariancji
var.test(k1, k2)
# wariancje są statystycznie równe

# H0: średnie k1 są równe średnim k2
# H1: ~H0
t.test(k1, k2, var.equal = TRUE)
# p-val > 0.05 : można przyjąć H0, średnie k1 i k2 są równe