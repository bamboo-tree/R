# Zu»ycie energii elektrycznej przez pewien zakªad przemysªowy w dziesi¦ciu
# kolejnych dniach wynosi (w kWh)
# 104; 100; 105; 110; 106; 105; 102; 107; 106; 105.
# (a) Zbada¢ czy mo»na zaªo»y¢, »e zu»ycie energii ma rozkªad normalny.
# (b) Zakªadaj¡c, »e zu»ycie energii ma rozkªad normalny, zwerykowa¢ hipotez¦
# H0 : σ2 = 4 wobec
# H1 : σ2̸ = 4.

library("EnvStats")

dane <- c(104, 100, 105, 110, 106, 105, 102, 107, 106, 105)

# H0: dane pochodzą z rozkładu normalnego
# H1: ~H0
shapiro.test(dane)
# p-val > 0.05 : można przyjąć H0

# H0: sigma^2 == 4
# H1: ~H0
varTest(dane, alternative = "two.sided", sigma.squared = 4)
# p-val > 0.05 : można przyjąć H0

# NOTE:
# jedna wariancja