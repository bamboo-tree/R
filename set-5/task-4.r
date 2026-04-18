airquality
head(airquality)
tail(airquality)

# H0: rozkład poziomu ozonu od maja do września jest taki sam
#     (cały zbiór to dane od maja do września, więc nie trzeba nic dzielić)

test_oz <- kruskal.test(Ozone ~ Month, data = airquality)
test_oz
# p-value < 0.05 - obala H0, rozkład ozonu nie jest taki sam od V do IX
boxplot(Ozone ~ Month, data = airquality, col = rainbow(5),
        main = "Ozon od V do IX")

# H1: rozkład temperatur od maja do września jest taki sam

test_tmp <- kruskal.test(Temp ~ Month, data = airquality)
test_tmp
# p-value < 0.05 - obala H1, rozkład tempertatur nie jest taki sam od V do IX
boxplot(Temp ~ Month, data = airquality, col = rainbow(5),
        main = "Temperatura od V do IX")

# H2: rozkład tempertur od lipca do sierpnia jest taki sam

lipiec <- subset(airquality, Month == 7)
sierpien <- subset(airquality, Month == 8)

test_tmp_7_8 <- ks.test(lipiec$Temp, sierpien$Temp)
test_tmp_7_8
# p-value > 0.05 - potwierdza H2, rozkład temperatur w VII i VIII jest taki sam
boxplot(lipiec$Temp, sierpien$Temp, data = airquality, col = rainbow(2),
        main = "Temperatura od VII do VIII")

# NOTE: dla testu KS: dystrybuanty emiryczne (ecdf), wykres Q-Q
plot(ecdf(lipiec$Temp), las = 1, col = 2)
lines(ecdf(sierpien$Temp), col = 3)

qqplot(lipiec$Temp, sierpien$Temp, asp = 1)
abline(0, 1, col = 2)

# NOTE:
# test kruskala i ks
# wykres pudełkowy boxplot - kruskal
# wykres qq i ecdf - ks