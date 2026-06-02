# Pewna rma transportowa przetestowaªa cztery rodzaje opon na swoich samochodach, w losowych momen-
# tach czasu. ywotno±¢ opon wyra»ona w tysi¡cach przejechanych kilometrów okazaªa si¦ nast¦puj¡ca
# typ1 = c(33, 38, 36, 40, 31, 35, 36, 35)
# typ2 = c(32, 40, 42, 38, 30, 34, 38)
# typ3 = c(31, 37, 35, 33, 34, 30, 34)
# typ4 = c(29, 34, 32, 30, 33, 31, 32, 30)
# Wykorzystuj¡c analiz¦ wariancji sprawdzi¢, czy istniej¡ istotne ró»nice pomi¦dzy rodzajem opon a ich »y-
# wotno±ci¡

typ1 <- c(33, 38, 36, 40, 31, 35, 36, 35)
typ2 <- c(32, 40, 42, 38, 30, 34, 38)
typ3 <- c(31, 37, 35, 33, 34, 30, 34)
typ4 <- c(29, 34, 32, 30, 33, 31, 32, 30)

O <- stack(list(t1 = typ1, t2 = typ2, t3 = typ3, t4 = typ4))
colnames(O) <- c("opony", "typ")
head(O)

# badamy normalność
by(O$opony, O$typ, shapiro.test)
# wszystkie rozkłady są normalne

par(mfrow = c(2, 2))
by(O$opony, O$typ, function(x) {
  qqnorm(x)
  qqline(x)
})
par(mfrow = c(1, 1))
# można przyjąć, że wszystkie próby pochodza z rozkładu normalnego

# H0: Var1 == ... == Var4
# H1: ~H1
bartlett.test(opony~typ, data=O)
# p-val > 0.05 : można przyjąć H0

# NORMALNOŚĆ I RÓWNOŚĆ WARIANCJI, MOŻNA PRZYSTĄPIĆ DO ANALIZY WARIANCJI

library(doBy)
summaryBy(opony~typ, data=O, FUN=c(mean, var, sd, length))
boxplot(opony~typ, data=O)

# analiza wariancji

# H0: mu1 == ... == mu4
# H1: ~H0
analiza3 <- aov(opony~typ, data=O)
summary(analiza3)
# p-val < .05 : odrzucamy H0, średnie są różne

summary(O)
plot.design(O)

# testy post-hoc

library(agricolae)

pairwise.t.test(O$opony, O$typ)

por <- LSD.test(analiza3, "typ")
plot(por)

tuk <- TukeyHSD(analiza3)
plot(tuk)

