m <- rbind(
  c(748, 821, 786, 720, 672),
  c(74, 60, 51, 66, 50),
  c(31, 25, 22, 16, 15),
  c(9, 10, 6, 5, 7)
)
colnames(m) <- c("21 - 30", "31 - 40", "41 - 50", "51 - 60", "61 - 70")
rownames(m) <- c("0", "1", "2", ">2")
m

# H0: liczba spowodowanych wypdaków nie zależy od wieku kierowcy

test <- chisq.test(m)
test
# p-val > 0.05 : przyjmujemy H0

par(mfrow = c(1, 2))
mosaicplot(m, las = 1, col = rainbow(5))
barplot(m, beside = TRUE, col = rainbow(4))
par(mfrow = c(1, 1))

m <- cbind(m, Suma1 = rowSums(m))
m <- rbind(m, Suma2 = colSums(m))
m

748 / 4194  # 21 -30 lat i 0 wypadków
862 / 4194  # wiek 21 - 30 lat
3747 / 4194 # 0 wypadków
748 / 862   # 0 wypadków pod warunkiem 21 - 30 lat
# różnią sie nie wiele (warunek nie ma wpływu na prawdopodobieństwo)

# NOTE:
# test niezależności chisq.test
# tworzenie macierzy do testu chisq
# wykres mozaikowy i słupkowy