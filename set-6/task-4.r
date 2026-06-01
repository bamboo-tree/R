# Zbada¢ zgodno±¢ zbioru danych, zawieraj¡cych pierwsz¡ cyfr¦ znacz¡c¡ liczby ludno±ci w miastach w 2020
# roku, z rozkªadem Benforda.
# Uwaga. Test zgodno±ci chi-kwadrat mo»na wykona¢ za pomoc¡ funkcji chisq.test. Mo»na tak»e wykorzysta¢
# funkcje dost¦pne w pakiecie benford.analysis, m.in. extract.digits do "wyci¡gni¦cia" pierwszych cyfr
# znacz¡cych z danych.

data <- read.csv(file = "set-6/miasta.csv", header = TRUE, fileEncoding = "Windows-1250", sep = ";")
head(data)

ludnosc <- data$lud
ludnosc

library(benford.analysis)

# H0: rozkład pierwszej cyfry znaczącej w liczbie ludności w poszczególnych
#     miastach jest zgodny z rozkładem Benforda
# H1: ~H0
test <- benford(ludnosc, number.of.digits = 1)
test
chisq(test)
# p-val = 0.00751 < 0.05 : odrzucamy H0

# NOTE:
# benford test
# liczba ludności
# pierwsza cyfra