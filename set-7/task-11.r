# Zwa»ono losowo wybrane mandarynki z dwóch ró»nych plantacji i otrzymano nast¦puj¡ce wyniki (w gramach)
# Waga1 =c(78.3, 75.2, 78.7, 79, 62.2, 68.1, 67, 69.8, 73.5, 78.9, 71.5, 83.9, 73.2, 67.1, 71, 70.6,
# 81.1, 78, 74, 75.2, 75, 63.7, 68.5, 70.6)
# Waga2 =c(68.8, 66.9, 73.2, 71.6, 90, 76.8, 71.2, 84, 80.5, 74.9, 76.6, 76.2, 73, 82.3, 78.7,
# 76.2, 72.9, 73.4, 85, 87.6, 73.7, 83.4, 83.3, 75.1).
# Czy mo»na twierdzi¢, »e ±rednia waga mandarynek jest taka sama dla ka»dej z plantacji?

waga1 <- c(78.3, 75.2, 78.7, 79, 62.2, 68.1, 67, 69.8, 73.5, 78.9, 71.5, 83.9, 73.2, 67.1, 71, 70.6, 81.1, 78, 74, 75.2, 75, 63.7, 68.5, 70.6)
waga2 <- c(68.8, 66.9, 73.2, 71.6, 90, 76.8, 71.2, 84, 80.5, 74.9, 76.6, 76.2, 73, 82.3, 78.7, 76.2, 72.9, 73.4, 85, 87.6, 73.7, 83.4, 83.3, 75.1)

# badamy normalność próbki
shapiro.test(waga1)
shapiro.test(waga2)
# p-val > 0.05 : próby pochodzą z rozkładu normlanego

# badamy równość wariancji
# H0: wariancje są sobie równe
# H1: ~H0
var.test(waga1, waga2)
# p-val > 0.05 : można przyjąć H0

boxplot(waga1, waga2, col = rainbow(2))
abline(h = mean(waga1), col = 2, lwd = 2)
abline(h = mean(waga2), col = 3, lwd = 2)

# H0: mu1 = mu2 <==> (mu1 - mu2 = 0)
# H1: ~H0
t.test(waga1, waga2, var.equal = TRUE, mu = 0, alternative = "two.sided") 
# p-val < 0.05 : odrzuczamy H0 : średnie nie są równe

# H0: mu1 = mu2 <==> (mu1 - mu2 = 0)
# H1: mu1 < mu2
t.test(waga1, waga2, var.equal = TRUE, alternative = "less") 
# p-val < 0.05: odrzucamy H0 : średnia mu1 jest mniejsza od średniej mu2

# H0: mu1 = mu2 <==> (mu1 - mu2 = 0)
# H1: mu1 > mu2
t.test(waga1, waga2, var.equal = TRUE, alternative = "greater") 
# p-val > 0.05: nie ma podstaw do stwierdzenia, że średnia z plantacji 1 jest większa 

# NOTE:
# równość dwuch średnich