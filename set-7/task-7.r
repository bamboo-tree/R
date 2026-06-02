# Zbadano wzrost 13 m¦»czyzn oraz 12 kobiet w pewnym o±rodku sportowym i otrzymano wyniki:
#  Kobiety: 161, 162, 163, 162, 166, 164, 168, 165, 168, 157, 161, 172.
#  M¦»czy¹ni: 171, 176, 179, 189, 176, 182, 173, 179, 184, 186, 189, 167, 177.
# Czy mo»na powiedzie¢, »e m¦»czy¹ni charakteryzuj¡ si¦ wi¦ksz¡ zmienno±ci¡ wzrostu?

k <- c(161, 162, 163, 162, 166, 164, 168, 165, 168, 157, 161, 172)
m <- c(171, 176, 179, 189, 176, 182, 173, 179, 184, 186, 189, 167, 177)

# sprawdzamy normalność próbek
shapiro.test(k)
shapiro.test(m)
# p-val > 0.05 - przyjmujemy że próby pochodzą z rozkładu normalnego

# H0: wariancja kobiet jest równa wariancji mężczyzn
# H1: wariancja mężczyzn jest większa od wairancji kobiet
var.test(k, m, alternative = "less") # kolejność MA ZNACZENIE
# p-val < 0.05 - odrzucamy H0

# NOTE:
# porównanie zmienności
# var.test
