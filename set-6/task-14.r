# Boston Celtics 2024/2025). Na podstawie danych zawartych w csv-09(BC2425) zbada¢,
# czy liczba zdobytych punktów w kolejnych meczach ma charakter losowy.

# dane były w pliku txt, a sam csv wygląda osobliwie :/

data <- read.csv(file = "set-6/boston.csv", sep = ",", header = TRUE)
head(data)

# Opp to punkty ???
punkty <- data$Opp
punkty

library("randtests")
# H0: punkty mają charakter losowy
# H1: ~H0
runs.test(punkty, plot = TRUE)
# p-val = 0.1824 > 0.05 : można przyjąć H0