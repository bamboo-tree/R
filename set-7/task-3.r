# Zu»ycie wody w fabryce w kolejnych dniach podlega losowym wahaniom.
# Na podstawie obserwacji dla n = 365 dni roku stwierdzono, »e
# ¯x365 = 102 m3 oraz s2 365 = 81 (m3)2.
# Zwerykowa¢ hipotez¦ H0 : μ = 100 m3, wobec H1 : μ > 100 m3

library("PASWR2")

# x = 102
# s^2 = 81
# n = 365
# mu = 100
# H0: mu == 100
# H1: mu > 100 - alternative = "greater"
tsum.test(mean.x = 102, s.x = sqrt(81), n.x = 365, mu = 100,
          alternative = "greater")
# p-val < 0.05 : odrzucamy H0

# NOTE:
# jedna średnia