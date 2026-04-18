tab <- HairEyeColor
View(tab)

# H0: kolor oczu u mężczyzn jest cechą statystycznie niezależną od koloru włosów

m <- tab[, , 1] # some magic numbers...
m

# NOTE: do testu niezależności chisq.test !!!
test <- chisq.test(m)
test
# p-value < 0.05 - obala H0, kolor oczu i włosów jest od siebie zależny

par(mfrow = c(1, 2))
mosaicplot(m, las = 1, col = rainbow(4), main = "oczy vs włosy")
barplot(m, beside = TRUE, col = rainbow(4))
par(mfrow = c(1, 1))

male <- tab[, , 1]
male <- cbind(male, Suma1 = rowSums(male))
male <- rbind(male, Suma2 = colSums(male))
male

# NOTE:
# test niezależności chisq.test
# wykres mozaikowy