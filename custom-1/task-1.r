# Zadanie 1 (Łączenie wizualizacji i estymacji) - wygenreowane przez AI
# Wygeneruj próbkę 200 liczb z rozkładu normalnego N(50, 10).
# Narysuj histogram z 15 klasami.
# Na histogramie nałóż krzywą gęstości teoretycznej (z estymowanych parametrów)
# oraz krzywą gęstości empirycznej (funkcja density).
# Dodaj legendę, tytuł i podpisy osi.

dane <- rnorm(200, mean = 50, sd = 10)

# Histogram z gęstościami (ważne: freq = FALSE)
h <- hist(dane, breaks = 15, col = "lightblue",
          freq = FALSE,
          main = "Histogram z gęstościami",
          xlab = "Wartości",
          ylab = "Gęstość")

# Estymacja parametrów z próbki (nie z mids!)
m_est <- mean(dane)
sigma_est <- sd(dane)

# Dodanie teoretycznej krzywej gęstości normalnej
curve(dnorm(x, mean = m_est, sd = sigma_est), 
      add = TRUE, col = "red", lwd = 2)

# Dodanie empirycznej krzywej gęstości (jądrowa)
lines(density(dane), col = "blue", lwd = 2)

# Legenda
legend("topright", 
       legend = c("Gęstość teoretyczna", "Gęstość empiryczna"),
       col = c("red", "blue"), lwd = 2)