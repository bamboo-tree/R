# ZADANIE 5. Rozkªad Benforda
# Zbada¢ zgodno±¢ zbioru danych, zawieraj¡cych pierwsz¡ cyfr¦ znacz¡c¡ liczby ludno±ci w hrabstwach w USA,
# z rozkªadem Benforda (plik csv-06(USA))

data <- read.csv("set-6/usa.csv", sep = ",", header = TRUE)
head(data)

library(benford.analysis)

c <- extract.digits(data$Population, 1)
tab <- table(c$data.digits)
tab

ben <- log10(1 + 1/c(1:9))
ben

# H0: rozkład zgodny z benforda
# H1: ~H0
chisq.test(tab, p = ben)
# p-val > 0.05 : można potwierdzić H0

################################################################################

# Rozwiązanie podbne do poprzedniego

ludnosc <- data$Population
ludnosc

test <- benford(ludnosc, number.of.digits = 1)
test
chisq(test)
# identyczny wynik bez zbędnych obliczeń

# NOTE:
# benford test
# liczba ludności
# pierwsza cyfra