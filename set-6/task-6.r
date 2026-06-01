# Niech próbka losowa okre±lona b¦dzie w nast¦puj¡cy sposób
# set.seed(45) (ziarno)
# probka=rexp(1000, 0.00001) (liczby losowe).
# Zbada¢ zgodno±¢ tego zbioru danych z rozkªadem Benforda bior¡c pod uwag¦ dwie pierwsze cyfry znacz¡ce
# tych liczb.

set.seed(45)

probka <- rexp(1000, 0.00001)
probka

library(benford.analysis)

# H0: próbka zgodna z rozkładem benforda
# H1: ~H0
test <- benford(probka, number.of.digits = 2)
test
chisq(test)
# p-val = 0.9881 > 0.05 : można potwierdzić H0