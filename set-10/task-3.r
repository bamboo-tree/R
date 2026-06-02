# Przeprowadzi¢ dwuczynnikow¡ analiz¦ wariancji dla danych zgromadzonych w ramce ToothGrowth, tzn.
# zbada¢ jaki wpªyw ma dawka witaminy C i sposób jej podania na dªugo±¢ z¦bów ±winek morskich.

R <- ToothGrowth
head(R)
summary(R)

# PRZYGOTOWANIE DANYCH DO ANALIZY WARIANCJI

# as.factor zamienia wartości liczbowe w zgrupowane czynniki
R$dose <- as.factor(R$dose)
summary(R)

boxplot(len~dose, data = R, col = rainbow(3))
boxplot(len~supp, data = R, col = rainbow(3))

# interaction pozwala stworzyć wszyskie pary (w tym przypadku czynników i dawki)
R$g <- with(R, interaction(supp, dose, sep = "-"))
head(R)

# TESTY WSTĘPNE

# test normalności
by(R$len,  R$g, shapiro.test)
# p-val > 0.05 : rozkład jest normalny

# test równości wariancji
bartlett.test(len~g, data = R)
# p-val > 0.05 : można przyjąć że wariancje są równe

# inny test równości wariancji
library(car)
leveneTest(len~supp*dose, data = R)

head(R)
plot.design(R[,1:3])

# analiza warinacji dwuczynnikowej
# H0-A:   sposób implementacji witaminy C nie ma instotnego wpływu niezależnie od dawki
# H1-A:   !H0-A
# H0-B:   dawka witmainy C nie ma instotnego wpływu na długość zębów, niezależnie od sposobu podania
# H1-B:   !H0-B
# H0-AB:  między sposobem podania a dawką nie zachodzi interakcja

analiza3 <- aov(len~supp*dose, data = R)
summary(analiza3)
# Sposób podania jest statystycznie istotny, czyli świnki morskie miały dłuższe
# zęby po jednym ze sposobów podania. H0-A: odrzucamy

# Dawka ma duży wpływ na długość zębów. Im większa dawka tym dłuższe zęby.
# H0-B: odrzucamy

# Interakacja jest istotna statystycznie. Wpływ sposóbu podania witaminy C zależy
# od tego jak dużą dawkę zaaplikowno. H0-AB: odrzucamy

# wykresy interakcji - jako że odrzuciliśmy wszystkie hipotezy
interaction.plot(R$supp, R$dose, R$len, col = rainbow(3), lwd = 4)
# średnia długość przy dawce 0.5 i 1 spada jeśli podajemy czystą witaminę C
# nie ma znaczenia sposób podania jeśli dawka wynosi 2

interaction.plot(R$dose, R$supp, R$len, col = rainbow(3), lwd = 4)
# sok pomarańczowy lepiej stymuluje wzrost zębów w porównaniu do czystej witaminy C
# dla dawki 0.5 i 1
# sposób podania nie ma znaczenia dla dawki 2

# testy post-hoc
TukeyHSD(analiza3, "dose")
plot(TukeyHSD(analiza3, "dose"))

library(agricolae)
LSD.test(analiza3, "dose")
plot(LSD.test(analiza3, "dose"))

# NOTE:
# analiza czynników
# wykresy interakcji