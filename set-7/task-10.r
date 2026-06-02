# Wykonano pi¦¢ serii do±wiadczalnych pewnych wyrobów, ka»da o liczno±ci 7 sztuk, przy zastosowaniu innej
# technologii dla ka»dej serii. Warto±ci obserwowanej cechy X podano w poni»szej tabeli
# nr sztuki tech1 tech2 tech3 tech4 tech5
# 1 63 35 75 69 44
# 2 39 54 62 58 46
# 3 66 38 42 40 25
# 4 65 25 43 68 59
# 5 60 24 27 51 31
# 6 43 22 81 25 38
# 7 37 37 66 23 32
# Zwerykowa¢ hipotez¦, »e wariancje cechy X przy ka»dej technologii s¡ takie same,
# czyli H0 : σ2 1 = σ2 2 = σ2 3 = σ2 4 = σ2 5 , wobec alternatywnej H1 :∼ H0.

tech1 <- c(63,39,66,65,60,43,37)
tech2 <- c(35,54,38,25,24,22,37)
tech3 <- c(75,62,42,43,27,81,66)
tech4 <- c(69,58,40,68,51,25,23)
tech5 <- c(44,46,25,59,31,38,32)

l <- list(tech1, tech2, tech3, tech4, tech5)

# test normalności
lapply(l, shapiro.test)
# dane pochodzą z rozkładu normalnego

# H0: wariancje są równe
# H0: ~H0
bartlett.test(l)
# p-val = 0.4868 > 0.05 : można przyjąć H0, wariancje są statystycznie równe

# NOTE:
# test bartletta
# równość wielu wariancji