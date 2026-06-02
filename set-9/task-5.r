# Przeprowadzi¢ jednoczynnikow¡ analiz¦ wariancji dla zmiennych "Sepal.Length","Sepal.Width" , z ramki
# danych iris. Zbada¢, czy gatunek kwiatu ma wpªyw na ±redni¡ dªugo±¢ dziaªki kielicha. Zbada¢, czy gatunek
# kwiatu ma wpªyw na ±rednia szeroko±¢ dziaªki kielicha.

i <- iris
head(i)

# sprawdzamy normalność
by(i$Sepal.Length, i$Species, shapiro.test)
# możemy przyjąć normalność prób

# sprawdzamy równość wariancji
bartlett.test(Sepal.Length~Species, data=i)
# p-val < 0.05 : wariancje są różne (odrzucamy H0)

kruskal.test(Sepal.Length~Species, data=i)
# p-val < 0.05 : odrzucamy H0 (dane mają różne średnie)

set <- subset(i, Species=="setosa")
ver <- subset(i, Species=="versicolor")
vir <- subset(i, Species=="virginica")
summary(i)
plot.design(i)

# H0: mu1 == mu2
# H1: mu1 > mu2
t.test(vir$Sepal.Length, ver$Sepal.Length, alternative="greater")
# p-val < 0.05 : odrzycamy H0
