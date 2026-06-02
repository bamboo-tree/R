# Zbadano czas (w minutach) wykonania tego samego testu przez dwie niezale»ne grupy studentów:
# Grupa A : 12, 15, 14, 16, 13, 17, 15, 14
# Grupa B: 10, 11, 9, 12, 8, 10, 11, 9, 10, 12 Czy mo»na powiedzie¢, »e Grupa A charakteryzuj¡ si¦ mniejsz¡
# zmienno±ci¡ czasu wykonania testu ni» Grupa B?

a <- c(12, 15, 14, 16, 13, 17, 15, 14)
b <- c(10, 11, 9, 12, 8, 10, 11, 9, 10, 12)

# test normalności
shapiro.test(a)
shapiro.test(b)
# obie grupy posiadają charakterystykę rozkładu normalnego

# H0: s^2 A == s^2 B  (wariancje są równe)
# H1: s^2 A < s^2 B   (wariancja grupy A jest MNIEJSZA od wariancji grupy B)
var.test(a, b, alternative = "less")
# p-val > 0.05 : przyjmujemy H0 czasy są takie same

# NOTE:
# porównanie wariancji