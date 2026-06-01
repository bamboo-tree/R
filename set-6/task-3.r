# W poni»szej tabeli zamieszczono statystyk¦ wyst¦powania pierwszej cyfry w pi¦ciu ro»nych zbiorach danych.
# Zbada¢ zgodno±¢ tych danych z rozkªadem Benforda.
# cyfra 1 2 3 4 5 6 7 8 9
# dane1 33 20 12 10 6 6 5 7 3
# dane2 25 15 10 7 4 4 7 2 2
# dane3 320 190 108 82 65 59 48 37 42
# dane4 505 259 171 127 101 98 80 66 62

dane1 <- c(33, 20, 12, 10, 6, 6, 5, 7, 3)
dane2 <- c(25, 15, 10, 7, 4, 4, 7, 2, 2)
dane3 <- c(320, 190, 108, 82, 65, 59, 48, 37, 42)
dane4 <- c(505, 259, 171, 127, 101, 98, 80, 66, 62)

library(benford.analysis)

# H0: dane ze zbiory dane1 są zgodne z rozkładem Benforda
# H1: ~H0
recreate_data <- rep(1:9, times = dane1)
test <- benford(recreate_data, number.of.digits = 1)
test
chisq(test)
# p-val = 0.965 > 0.05 : można potwierdzić H0

# H0: dane ze zbiory dane1 są zgodne z rozkładem Benforda
# H1: ~H0
recreate_data <- rep(1:9, times = dane2)
test <- benford(recreate_data, number.of.digits = 1)
test
chisq(test)
# p-val = 0.8178 > 0.05 : można potwierdzić H0

# H0: dane ze zbiory dane1 są zgodne z rozkładem Benforda
# H1: ~H0
recreate_data <- rep(1:9, times = dane3)
test <- benford(recreate_data, number.of.digits = 1)
test
chisq(test)
# p-val = 0.06677 > 0.05 : można potwierdzić H0

# H0: dane ze zbiory dane1 są zgodne z rozkładem Benforda
# H1: ~H0
recreate_data <- rep(1:9, times = dane4)
test <- benford(recreate_data, number.of.digits = 1)
test
chisq(test)
# p-val = 0.05391 > 0.05 : można potwierdzić H0

# NOTE:
# benford test
# odtwarzanie danych