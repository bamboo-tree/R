# Zbada¢ zgodno±¢ poni»szego zbioru danych z rozkªadem Benforda bior¡c pod uwag¦ pierwsz¡ cyfr¦ znacz¡c¡
# tych liczb.
# zbior= c(17, 50, 1209, 83, 12, 100, 88, 804, 107, 15, 60, 55, 82, 901, 84, 37, 175, 160, 30, 320, 2, 94, 44, 167, 27, 84,
# 203, 89, 3, 45, 707, 35, 906, 24, 306, 29, 42, 558, 39, 94, 30, 25, 12, 14, 74, 192, 94, 375, 95, 200, 325, 284, 38, 20, 10, 12,
# 445, 27, 1, 63, 70, 604)


zbior <- c(17, 50, 1209, 83, 12, 100, 88, 804, 107, 15, 60, 55, 82, 901, 84, 37, 175, 160, 30, 320, 2, 94, 44, 167, 27, 84,
203, 89, 3, 45, 707, 35, 906, 24, 306, 29, 42, 558, 39, 94, 30, 25, 12, 14, 74, 192, 94, 375, 95, 200, 325, 284, 38, 20, 10, 12,
445, 27, 1, 63, 70, 604)

library(benford.analysis)

# H0: próbka zgodna z rozkładem benforda
# H1: ~H0
test <- benford(zbior, number.of.digits = 1)
test
chisq(test)
# p-val = 0.1449 > 0.05 : można potwierdzić H0