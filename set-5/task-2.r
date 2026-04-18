n1 <- c(30.8, 32.6, 31.7, 33.1, 31.2, 28.3, 29.8, 32.0, 27.9, 28.5)
n2 <- c(33.1, 31.8, 29.7, 29.0, 32.2, 33.1, 33.7, 30.4, 33.0, 28.9, 30.0)
n3 <- c(32.5, 34.8, 34.6, 35.2, 33.4, 33.1, 32.8, 35.0, 34.2, 34.8, 33.9)

# H0: rozkłady plonów dla każdego typu nawozu sa jednakowe (kruskal test)

test <- kruskal.test(list(n1, n2, n3))
test
# p-value < 0.05 - H0 jest odrzucona. Rozkład wśród nawozów nie jest jednakowy

boxplot(list(n1, n2, n3), col = c(2, 4, 6))
stripchart(list(n1, n2, n3), pch = 6, add = TRUE, vertical = TRUE)

#- Przykład tworzenia rangi ----------------------------------------------------
a <- c(1, 2, 3)
b <- c(1, 4, 3, 5)
d <- c(2, 3, 4)

m <- c(a, b, d)

rank(m)
sort(rank(m))
mean(rank(m))

mean(rank(a))
mean(rank(b))
mean(rank(d))
#-------------------------------------------------------------------------------

lista <- list(A = n1, B = n2, C = n3)
r1 <- stack(lista) # tworzy ramkę danych
r1
colnames(r1) <- c("plony", "odmiana")
View(r1)

r1$rangi <- rank(r1$plony)
head(r1)

boxplot(plony ~ odmiana, col = rainbow(3), data = r1)
boxplot(rangi ~ odmiana, col = rainbow(3), data = r1)

aggregate(plony ~ odmiana, FUN = mean, data = r1)
aggregate(rangi ~ odmiana, FUN = mean, data = r1)

# NOTE:
# test kruskala - jeśli trzeba porównać kilka zbiorów próbek pod względem
# podobieństwa rozkładu
# liczenie rangi