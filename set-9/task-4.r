# Przeprowadzi¢ jednoczynnikow¡ analiz¦ wariancji dla danych zgromadzonych w ramce chickwts. Zbada¢
# czy na ±redni¡ wag¦ kurczaków na wpªyw rodzaj po»ywienia, tzn. czy ±rednie wagi s¡ podobne czy te» ró»ne

C <- chickwts
head(C)

# test normalności
par(mfrow = c(2, 3))
by(C$weight, C$feed, function(x) {
  qqnorm(x)
  qqline(x)
})
par(mfrow = c(1, 1))

# H0: Var1 == ... == Var4
# H1: ~H1
bartlett.test(weight~feed, data=C)
# p-val > 0.05: można potwierdzić H0

boxplot(weight~feed, data=C)

# H0: mu1 == ... == mu4
# H1: ~H0
analiza <- aov(weight~feed, data=C)
summary(analiza)
# p-val < .05 : odrzucamy H0, średnie są różne

# post-hoc

summary(C)
plot.design(C)

library(agricolae)

pairwise.t.test(C$weight, C$feed)

por <- LSD.test(analiza, "feed")
plot(por)

tuk <- TukeyHSD(analiza)
plot(tuk)
