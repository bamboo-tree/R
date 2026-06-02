# Porównano spalanie samochodów z automatyczn¡ i manualn¡ skrzynia biegów [mile na galony].Dane zawarte
# s¡ w mtcars. Czy mo»na twierdzi¢, »e samochody z skrzyni¡ automatyczn¡ spalaj¡ wi¦cej ni» samochody ze
# skrzyni¡ manualn¡.

dane <- mtcars
head(dane)

# Spalanie dla automatycznej skrzyni (am == 0)
a <- dane$mpg[dane$am == 0]
# Spalanie dla manualnej skrzyni (am == 1)
m <- dane$mpg[dane$am == 1]

# test normalności
shapiro.test(m)
shapiro.test(a)
# rozkład jest normalny

# test równości wariancji
var.test(m, a)
# wariancje są równe

# H0: średnie spalanie w manualu jest takie samo jak w automacie
# H1: średnie spalanie w automacie jest mniejsze niż w manualu
t.test(a, m, alternative = "less", var.equal = TRUE)
# p-val < 0.05: odrzucamy H0, nie ma dowodów na większe spalanie w automacie