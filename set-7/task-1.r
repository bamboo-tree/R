# Reklamacji klientów, którzy zakupili m¡k¦ wyprodukowan¡ w pewnym
# mªynie wynika, »e wyst¦puj¡ niedowa»one opakowania m¡ki w stosunku do wagi wymaganej, wynosz¡cej
# 1000g. Zachodzi wi¦c potrzeba kontroli zgodno±ci opakowania m¡ki z norm¡. W tym celu zwa»ono 25 opa-
# kowa« m¡ki uzyskuj¡c nast¦puj¡ce wyniki (w gramach)
# 1000.33, 1004.97, 998.98, 1000.85, 1000.42, 1001.68, 999.58, 1001.16, 1001.79, 997.64, 1001.59, 1000.56,
# 1003.26, 996.25, 995.83, 999.56, 1002.08, 998.89, 998.09, 1004.42, 1002.14, 998.01, 1002.79, 999.56, 1001.72.
# Na podstawie powy»szej próby nale»y sprawdzi¢, czy ±rednia waga opakowania m¡ki ró»ni si¦ istotnie od
# normy

p <- c(1000.33, 1004.97, 998.98, 1000.85, 1000.42, 1001.68, 999.58, 1001.16,
       1001.79, 997.64, 1001.59, 1000.56, 1003.26, 996.25, 995.83, 999.56, 
       1002.08, 998.89, 998.09, 1004.42, 1002.14, 998.01, 1002.79, 999.56, 1001.72)

# H0: waga mąki pochodzi z rozkładu normalnego
# H1: ~H0
shapiro.test(p)
# nie ma podstaw do odrzucenia H0

qqnorm(p)
qqline(p)

# H0: srednia waga opakowania mąki wynosi 1000g (mu == 1000)
# H1: ~H0 (mu ~= 1000)
t.test(p, mu = 1000, alternative = "two.sided")
# p-val = 0.3019 nie ma podstaw do odrzucenia H0
# waga opakowań mąki nie różni się istotnie od 1000g

# NOTE:
# średnia wartość z próbki
# kontrola jakości
# różnice w średniej