# Porównano wydajno±¢ mleczn¡ trzech ras krów w szczytowym okresie laktacji. U losowo wybranych sztuk
# zanotowano nast¦puj¡ce warto±ci laktacji (w litrach mleka)
# rasa ↓ warto±ci laktacji
# rasa 1 35 40 32 40 41 39
# rasa 2 35 48 42 48 45
# rasa 3 32 39 42 32 35 40
# Sprawdzi¢ czy rasa ma wpªyw na laktacje, tzn. czy ±rednie ilo±ci mleka sa podobne, czy tez ro»ne.


rasa1 <- c(35, 40, 32, 40, 41, 39)
rasa2 <- c(35, 48, 42, 48, 45)
rasa3 <- c(32, 39, 42, 32, 35, 40)
l <- list(R1 = rasa1, R2 = rasa2, R3 = rasa3)

R <- stack(l)
colnames(R) <- c("laktacja", "rasa")
head(R)

# test normalności - oba podejścia są poprawne
lapply(l, shapiro.test)
by(R$laktacja, R$rasa, shapiro.test)
# dane pochodzą z rozkładu normalnego

# test równości wariancji - oba podjeścia są poprawne
bartlett.test(l)
bartlett.test(laktacja ~ rasa, data = R)
# wariancje są równe względem siebie

# MOŻNA PRZYSTĄPIĆ DO ANALIZY WARIANCJI

# H0: mu1 == mu2 == mu3
# H1: ~H0
analiza <- aov(laktacja ~ rasa, data = R)
summary(analiza)
# odrzucamy H0 na rzecz H1

# test post-hoc

# test 1
pairwise.t.test(R$laktacja, R$rasa)
#    R1    R2
# R2 0.097 -
# R3 0.653 0.063
# średnie nie są względem siebie istotnie różne

# test 2
library(agricolae)
por <- LSD.test(analiza, "rasa")
plot(por)

# test 3
tuk <- TukeyHSD(analiza)
plot(tuk)
# srednie nie są istotnie różne

# WNIOSEK: rasa krów nie ma istotnego wpływu na laktacje

# NOTE:
# Analiza wariancji:
# 1. Test normalności
# 3. Test równości wariancji
# 4. Jeśli testy przeszły => aov
# 5. Utworzenie tabeli (kolejnośc ma znaczenie)
# 6. Analiza wariancji aov
# 7. Jeśli odrzucamy H0 => testy post-hoc
# 8. pairwise.t.test
# 9. LSD.test
# 9. TukeyHSD