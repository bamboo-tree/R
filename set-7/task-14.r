# Dªugo±ci piosenek, w sekundach, na pªytach Plastic Hearts (M. Cyrus) i Future Nostalgia (D. Lipa) s¡
# nast¦puj¡ce
# Cyrus = c(171, 205, 196, 169, 151, 189, 223, 196, 157, 188, 215, 235)
# Lipa = c(184, 183, 209, 193, 203, 194, 208, 258, 221, 218, 166)
# Zwerykowa¢ hipotez¦ H0 : μC = μL tzn. ze ±rednia dªugo±¢ piosenki na tych pªytach jest taka sama, wobec
# alternatywnej H1 : μC̸ = μL.


cyprus <- c(171, 205, 196, 169, 151, 189, 223, 196, 157, 188, 215, 235)
lipa <- c(184, 183, 209, 193, 203, 194, 208, 258, 221, 218, 166)

# test normalności
shapiro.test(cyprus)
shapiro.test(lipa)
# oba rozkłady są normalne

# równość wariancji
var.test(cyprus, lipa)
# wariancje są równe

# H0: mu C == mu L
# H1: ~H0
t.test(cyprus, lipa, var.equal = TRUE)
# średnia długość utworu jest taka sama