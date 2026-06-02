# Producent o±wiadcza, »e ±redni czas ±wiecenia »arówki wynosi 1000 godzin. Pobrano próbk¦ o liczno±ci
# n = 100 i stwierdzono, »e w tej próbce ¯x100 = 995 oraz s2
# 100 = 36.
# Zwerykowa¢ hipotez¦ H0 : μ = 1000, wobec H1 : μ < 1000 .

library("PASWR2")

# x = 995
# s^2 = 36
# n = 100
# mu = 1000
# H0: mu == 1000
# H1: mu < 1000 - alternative = "less"
tsum.test(mean.x = 995, s.x = sqrt(36), n.x = 100, mu = 1000, alternative = "less")
# p-val < 0.05: odrzucamy H0

# NOTE:
# jedna średnia