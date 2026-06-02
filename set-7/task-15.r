# Pobrano dwie losowe próby ziarn fasoli dwóch gatunków i zmierzono dªugo±¢ ziarn. Dla
# gatunku A otrzymano n1 = 450, ¯x1 = 12.3 mm, s1 = 1.8 mm, natomiast dla gatunku B n2 = 500, ¯x2 = 11.9
# mm, s2 = 2.1 mm. Zwerykowa¢ hipotez¦ H0, »e ±rednie dªugo±¢ ziarn obu gatunków fasoli s¡ takie same.

library("PASWR2")

# A
# x = 12.3
# s = 1.8
# n = 450

# B
# x = 11.9
# s = 2.1
# n = 500

# H0: muA == muB
# H1: ~H0
tsum.test(mean.x = 12.3, s.x = 1.8, n.x = 450,
          mean.y = 11.9, s.y = 2.1, n.y = 500,
          alternative = "two.sided", mu = 0, var.equal = FALSE)
# p-val = 0.001626 : odrzucamy H0, średnie są różne

# NOTE:
# tsum.test dla dwuch średnich