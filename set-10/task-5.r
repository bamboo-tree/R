# Badamy wpªyw czterech leków z grupy A oraz trzech leków z grupy B, na poziom pewnego
# parametru X we krwi. Celem leków jest obni»enie poziomu X. Przeprowadzi¢ dwuczynnikow¡ analiz¦ wariancji
# dla danych zgromadzonych w poni»szej tabeli. W tabeli tej podano warto±ci X w odpowiednich jednostkach.
# A, B B1 B2 B3
# A1 81, 78, 75, 84 82, 86, 75, 71 74, 68, 78, 82
# A2 83, 68, 79, 81 86, 70, 72, 78 62, 70, 70, 76
# A3 68, 66, 72, 76 74, 68, 78, 82 68, 66, 58, 71
# A4 72, 60, 65, 68 70, 64, 66, 80 63, 74, 76, 70
# Dane umieszczone s¡ w ramce danych csv-11(Leki)

L <- read.csv2("set-10/leki.csv", header = TRUE)
head(L)
summary(L)

# zamiana wartości liczbowych na kategoryczne
L$GrupaA <- as.factor(L$GrupaA)
L$GrupaB <- as.factor(L$GrupaB)
summary(L)

boxplot(Poziom~GrupaA, data = L)
boxplot(Poziom~GrupaB, data = L)

L$grupa <- with(L, interaction(GrupaA, GrupaB, sep="-"))
summary(L)

# normalność 
by(L$Poziom, L$grupa, shapiro.test)
# wszystkie próby pochodzą z rozkładu normalnego

# równość wariancji
bartlett.test(Poziom~grupa, data = L)
# przyjmujemy równość wariancji

plot.design(L[,1:3], lwd = 2)
# H0-A:   leki z grupy A nie mają istotnego wpływu na średni poziom czynnika X
# H1-A:   !H0-A
# H0-B:   leki z grupy B nie mają instotego wpływu na średni poziom czynnika X
# H1-B:   !H0-B
# H0-AB:  między grupa A i B nie ma interakcji

analiza <- aov(Poziom~GrupaA*GrupaB, data = L)
summary(analiza)
# odrzucamy H0-A:     leki z grupy A róznią się instotnie
# przyjmujemy H0-B:   leki z grupy B nie różnią się istotnie
# przyjmujemy H0-AB:  nie zachodzi interakcja między lekami, działanie jest addytywne

TukeyHSD(analiza, "GrupaA")
plot(TukeyHSD(analiza, "GrupaA"))
plot(LSD.test(analiza, "GrupaA"))
