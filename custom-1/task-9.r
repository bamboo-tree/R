# Zadanie 9 (Estymacja parametrów i test chi-kwadrat)
# Dane: w 200 losowaniach liczby 0…4 otrzymano:
# 0→20, 1→40, 2→60, 3→50, 4→30.
#     Oszacuj parametr λ rozkładu Poissona (metodą momentów).
#     Wykonaj test chi-kwadrat zgodności z rozkładem Poissona.
#     Jeśli trzeba, połącz ostatnie kategorie (oczekiwane < 5).
#     Narysuj wykres porównujący liczebności obserwowane i teoretyczne.
# Sugerowane funkcje: weighted.mean, dpois, chisq.test, barplot

xi <- 0:4
ni <- c(20, 40, 60, 50, 30)

lambda <- weighted.mean(xi, ni)
pr_teor <- dpois(xi, lambda)

oczekiwane <- pr_teor * sum(ni)
oczekiwane

# H0: rozkład jest zgodny z Poissona
# H1: rozkład NIE jest zgodny z Poissona
chisq.test(ni, pr_teor)
# p-value = 0.2202 > 0.05 : można potwierdzić H0

porownanie <- rbind(ni, oczekiwane)
rownames(porownanie) <- c("Obserwowane", "Oczekiwane")
colnames(porownanie) <- xi
porownanie

# Wykres słupkowy porównawczy
barplot(porownanie, beside = TRUE, 
        col = c("lightblue", "lightgreen"),
        main = paste("Porównanie liczebności (lambda =", round(lambda, 3), ")"),
        xlab = "Liczba zdarzeń (k)", 
        ylab = "Liczebność",
        legend.text = TRUE,
        args.legend = list(x = "topright"))

# Dodanie wartości na słupkach (opcjonalnie)
mp <- barplot(ni, col = "lightblue", 
              main = "Liczebności obserwowane",
              xlab = "k", ylab = "Liczebność")
text(mp, ni, labels = ni, pos = 3, cex = 0.8)
