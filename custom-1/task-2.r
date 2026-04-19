# Zadanie 2 (Test chi-kwadrat zgodności z rozkładem Poissona) - wygenerowane przez AI # nolint
# Symuluj 300 rzutów kostką do gry, ale zmodyfikuj kostkę tak, aby prawdopodobieństwa wynosiły: # nolint
# 1→0.1, 2→0.1, 3→0.1, 4→0.3, 5→0.2, 6→0.2.
# Wykonaj test chi-kwadrat zgodności z rozkładem jednostajnym (uczciwa kostka).
# Podaj wartość statystyki, p-value i interpretację.
# Sugerowane funkcje: sample, table, chisq.test

set.seed(123)
dane <- sample(x = 1:6, size = 300, replace = TRUE,
               prob = c(0.1, 0.1, 0.1, 0.3, 0.2, 0.2))
dane

tab <- table(dane)
tab
barplot(tab, col = rainbow(6))

# H0: kostka jest uczciwa, czyli szanse wypdanięcia ścianek są równe
# H1: kostka jest NIE uczciwa ==> !H0
test <- chisq.test(tab, p = rep(1 / 6, 6))
test
# p-val < 0.05 : można odrzucić H0, kostka jest nieuczciwa
