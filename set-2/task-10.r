rzuty <- sample(1:6, 200, replace = TRUE)
tablica <- table(rzuty)
barplot(tablica, col = rainbow(6))


rzuty1 <- sample(1:6, 200, replace = TRUE)
rzuty2 <- sample(1:6, 200, replace = TRUE)
tab1 <- table(rzuty1)
tab2 <- table(rzuty2)

macierz <- rbind(tab1, tab2)
barplot(macierz, beside = TRUE, legend.text = c("Serie 1", "Serie 2"),
        main = "Dwie serie 200 rzutów kostką", xlab = "Liczba oczek", ylab = "Częstość",
        col = c("lightblue", "lightgreen"), ylim = c(0, max(macierz) + 10))

# NOTE:
# seria rzutów kostką
# tablica kontyngencji
