# Dwóch kierowców przejechaªo po 30 okr¡»e« samochodem wy±cigowym z tymi samymi ustawieniami. Czasy
# przejazdów w sekundach zawarte s¡ w pliku csv-01(Kierowcy). Który z kierowców jest lepszy?

R <- read.csv2("set-7/kierowcy.csv", header = TRUE, sep = ";", dec = ".")
head(R)

k1 <- R$Kierowca1
k2 <- R$Kierowca2

shapiro.test(k1)
shapiro.test(k2)
# próbki pochodzą z rozkładu normalnego

summary(k1)
summary(k2)

# H0: var_k1 == var_k2
# H1: ~H0
var.test(k1, k2)
# p-val < 0.05 : odrzucamy H0

# H0: mu_k1 == mu_k2
# H1: mu_k1 < mu_k2
t.test(k1, k2, var.equal = FALSE, alternative = "less")
# p-val < 0.05 : odrzucamy H0, średnio kierowca 1 jest szybszy od 2

boxplot(R)