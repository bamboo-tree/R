dane <- read.csv("set-5/pomarancza.csv", sep = ";")
# !!! R ma dziwne podejście do ścieżek, skoro dane są w tym samym
# folderze, a i tak trzeba podać nazwę (może VSCode coś tu psuje nwm)
head(dane)

# H0: rozkład wag pomarańczy jest taki sam w każdej plantacji

test <- kruskal.test(Waga ~ Plantacja, data = dane)
test
# p-value < 0.05 - H0 jest odrzucone, rozkład jest różny

boxplot(Waga ~ Plantacja, data = dane, col = rainbow(4))

dane$Rangi <- rank(dane$Waga)
View(dane)

aggregate(Rangi ~ Plantacja, data = dane, FUN = mean)
mean(dane$Rangi)


# NOTE:
# liczenie średniej rangi
# kruskal test