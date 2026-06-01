# Zbada¢ czy ci¡g Fibonacciego, tzn. ci¡g liczbowy 1, 1, 2, 3, 5, 8, 13, 21, 34, . . . speªnia prawo Benforda, bior¡c
# pod uwag¦ pierwsza cyfr¦ oraz
# (a) pierwsze 100 wyrazów ci¡gu,
# (b) pierwsze 200 wyrazów ci¡gu,
# (c) pierwsze 300 wyrazów ci¡gu,
# (d) pierwsze 20 wyrazów ci¡gu.

fib <- function(n) {
  u <- numeric()
  u[1] <- 1
  u[2] <- 1
  for (i in c(3:n)) {
    u[i] = u[i-1] + u[i-2]
  }
  return (u)
}

options(scipen = 100) # bez notacji matematycznej
fib(100)

dane <- cyfra(fib(300), 1)
dane
tab <- table(dane)
tab
barplot(tab)

# liczenie prawdopodobieństwa empirycznego
pr_emp <- tab/sum(tab)
pr_emp
sum(pr_emp)

# rozkład benforda wg wzoru na przedziale od 1 do 9 (liczba nie zaczyna się od 0)
ben <- log10(1 + 1/c(1:9))
ben
sum(ben)

# wykres porównawczy
m <- rbind(pr_emp, ben)
m
barplot(m, beside = TRUE, space = c(0.2, 1), col = c(2, 3))

# korzystając z chisq test można porównać próbkę empiryczną z rozkładem teroetycznym
# H0: dane zgodne z rozkaładem Benforda
# H1: ~H0
chisq.test(tab, p = ben)
# p-val = 0.9999 > 0.05 : potwierdzamy H0

################################################################################

# to samo korzystając z biblioteki
library(benford.analysis)
# H0: zgodne z rozkładem benforda
# H1: ~H0
b <- benford(fib(300), number.of.digits = 1)
b
chisq(b)
# p-val = 0.9999 > 0.05 : potwierdzamy H0

################################################################################

# H0: pierwsza cyfra w ciągu pierwszych 20 liczb fib jest zgodna z rozkładem ben
# H1: ~H0
b <- benford(fib(20), number.of.digits = 1)
b
chisq(b)
# p-val = 0.912 > 0.05 : potwierdzamy H0

################################################################################

# Zamiast badać cyfry znaczące i ich rozkład możemy użyć log10 na danych i wziąć
# z tego część ułamkową. Teoria mówi że prawo benforda jest równoważne że
# mantysa od log10(x) ma rozkład jednostajny U(0, 1)

12.456 - trunc(12.456) # == 0.456
b$data
log10(6765) - trunc(log10(6756))

mantysa <- b$data$data.mantissa
mantysa

# KS test pozwala sprawdzić czy próbka jest zgodna z rozkładem
# test KS
# H0: mantysa ma rozkład U(0,1)
# H1: ~H0
ks.test(mantysa, "punif", 0, 1)
# p-val = 0.9883 > 0.05 : potwierdzamy H0

#plot(ecdf(mantysa), col = 2, add = TRUE)
#curve(punif(x, 0, 1), col = 4)
plot(qunif(ppoints(mantysa)), sort(mantysa), col = 2)
abline(0, 1)

x <- cos(2*pi*mantysa)
y <- sin(2*pi*mantysa)
plot(x, y, asp = 1)
# środek ciężkości
p <- c(mean(x), mean(y))
p
points(mean(x), mean(y), col = 2)
b$stats
mean(x)^2 + mean(y)^2 # odległość środka ciężkości do kwadratu równa się L2

# NOTE:
# ks.test
# prawo benforda
# cyfra znacząca