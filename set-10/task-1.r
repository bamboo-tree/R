# W ramce danych palmerpenguins znajduj¡ si¦ dane dotycz¡ce wagi trzech gatunków pingwinów: adelie
# (pingwin biaªooki), chinstrap (pingwin maskowy), gentoo (pingwin biaªobrewy).
# Wykorzystuj¡c analiz¦ wariancji zbada¢, czy ±rednia waga jest taka sama niezale»nie od gatunku

library(palmerpenguins)
data(package = "palmerpenguins")

head(penguins)
penguins_clean <- na.omit(penguins)

adelie <- subset(penguins_clean, species == "Adelie")$body_mass_g
chinstrap <- subset(penguins_clean, species == "Chinstrap")$body_mass_g
gentoo <- subset(penguins_clean, species == "Gentoo")$body_mass_g

boxplot(adelie, chinstrap, gentoo)

# test normalności
shapiro.test(adelie)
# p-value = 0.04232: brak normalności
shapiro.test(chinstrap)
# p-value = 0.5605 : rozkład normalny
shapiro.test(gentoo)
# p-value = 0.2605 : rozkład normalny

# Test normalności reszty
model <- aov(body_mass_g ~ species, data = penguins_clean)
reszty <- residuals(model)
shapiro.test(reszty)
# p-val > 0.05 : można przyjąć normalny rozkład próbki

qqnorm(reszty)
qqline(reszty, col = "red")

# test równości wariancji
bartlett.test(body_mass_g ~ species, data = penguins_clean)
# p-val > 0.05 : wariancje są równe

# H0: mu1 == mu2 == mu3
# H1: ~H0
analiza <- aov(body_mass_g ~ species, data = penguins_clean)
summary(analiza)
# p-val < 0.05: odrzucamy H0

# post-hoc
tuk <- TukeyHSD(analiza)
plot(tuk)
# średnia waga zależy od gatunku