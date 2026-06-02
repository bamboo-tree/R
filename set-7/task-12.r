# Na podstawie danych zawartych w pliku csv-08(Jajka,Kiwi) zwerykowa¢ hipotezy:
# (a) ±rednia waga jajek jest równa ±redniej wadze kiwi
# (b) ±rednia waga kiwi jest równa ±redniej wadze mandarynek
# (c) ±rednia waga jajek jest równa ±redniej wadze mandarynek.

dane <- read.csv("set-7/jajka_kiwi.csv", header = TRUE, sep = ";")
dane

jajka <- dane$Jajka
kiwi <- dane$Kiwi
man <- dane$Man
jajka

# test normalności
lapply(list(jajka, kiwi, man), shapiro.test)
# dane pochodzą z rozkładu normalnego


var.test(jajka, kiwi)
# wariancje są równe

# H0: mu jajek == mu kiwi
# H0: ~H0
t.test(jajka, kiwi, var.equal = TRUE)
# p-val > 0.05: średnia waga jajek jest statystycznie równa średniej wadze kiwi

var.test(kiwi, man)
# wariancje nie są równe

# H0: mu kiwi == mu man
# H0: ~H0
t.test(kiwi, man, var.equal = FALSE)
# p-val > 0.05: średnia waga kiwi jest statystycznie równa średniej wadze man

var.test(jajka, man)
# wariancje nie są równe

# H0: mu jajek == mu man
# H0: ~H0
t.test(jajka, man, var.equal = FALSE)
# p-val < 0.05: średnia waga jajek jest statystycznie różna od średniej wagi man

# NOTE:
# test równości średnich
# test równości wariancji