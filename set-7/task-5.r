# Dopuszczalne odchylenie standardowe maszyny paczkuj¡cej chipsy to 5 g.
# Zbadano prób¦ 8 paczek chipsów z ró»nych partii, otrzymuj¡c mas¦ (w gramach):
# 104, 92, 103, 98, 100, 92, 106, 110.
# Czy maszyna si¦ rozregulowaªa? Obliczenia prowadzimy na poziomie istotno±ci 0.05.

library("EnvStats")

dane <- c(104, 92, 103, 98, 100, 92, 106, 110)

# test normalności
shapiro.test(dane)
# p-val = 0.7116 > 0.05 : dane pochodzą z rozkładu normalnego

# H0: sigma == 5
# H1: sigman > 5 - alternative = "greater"
varTest(dane, alternative = "greater", sigma = 5)
# p-val = 0.1537633 > 0.05 : przyjmujemy H0, maszyna nie jest rozregulowana

# NOTE:
# jedna wariancja