# Celem badania marketingowego jest ocena, czy rodzaj opakowania pªatków ±niadaniowych ma wpªyw na licz-
# b¦ sprzedanych pudeªek pªatków. Sa trzy rodzaje opakowa«: A, B i C. Wyniki obserwacji liczby sprzedanych
# pudeªek z losowo wybranych sklepów s¡ nast¦puj¡ce:
# A = c(52, 48, 43, 50, 43, 44, 46, 46, 43, 49, 38, 42, 42, 35, 33, 38, 39)
# B = c(28, 35, 34, 32, 34, 27, 31, 27, 29, 25, 43, 34, 33, 42, 41, 37, 37)
# C = c(15, 14, 23, 21, 14, 20, 21, 16, 20, 14, 23, 25, 18, 26, 18, 26, 20)
# Wykorzystuj¡c analiz¦ wariancji zbada¢, czy rodzaj opakowania ma wpªyw na liczb¦ sprzedanych pudeªek
# pªatków.


A <- c(51, 48, 43, 50, 43, 44, 46, 46, 43, 49, 38, 42, 42, 35, 33, 38, 39)
B <- c(28, 35, 34, 32, 34, 27, 31, 27, 29, 25, 43, 34, 33, 42, 41, 37, 37)
C <- c(15, 14, 23, 21, 14, 20, 21, 16, 20, 14, 23, 25, 18, 26, 18, 26, 20)
l <- list(A, B, C)

# test normalności
lapply(l, shapiro.test)
# dane pochodzą z rozkładu normalnego

# test wariancji
bartlett.test(l)
# p-val > 0.05 : wariancje są statystycznie równe

# spełnione są założenia normalności i równości wariancji, możemy zastosować analizę wariancji
R <- stack(list(A = A, B = B, C = C))
colnames(R) <- c("platki", "rodzaj")
head(R)

boxplot(platki~rodzaj, data = R, col = rainbow(3))
abline(h = mean(R$platki))
abline(h = lapply(list(A, B, C), mean), col = rainbow(3), lwd = 2)

plot.design(R)

# ANALIZA WARIANCJI

# H0 : mu1 == mu2 == mu3
# H1 : ~H0
analiza1 <- aov(platki~rodzaj, data = R)
analiza1
summary(analiza1)
# odrzucamy H0 na rzecz H1

# testy porównań wielokrotnych post-hoc, wykonujemy po fakcie kiedy stwierdzimy
# brak równości średnich. Wykrywają one, które grupy są odpowiedzialne za 
# odrzucenie hipotezy

# test 1
pairwise.t.test(R$platki, R$rodzaj)
# wszystkie średnie są względem siebie istotnie różne

# test 2
library(agricolae)
por <- LSD.test(analiza1, "rodzaj")
por
plot(por)

# test 3
TukeyHSD(analiza1)
plot(TukeyHSD(analiza1))
# trzy średnie są różne

# WNIOSEK: Liczba sprzedanych opakowań płatków zależy od rodzaju opakowania
# najczęściej kupowane są płatki A, a najrzadziej C

# NOTE:
# analiza wariancji
# aov