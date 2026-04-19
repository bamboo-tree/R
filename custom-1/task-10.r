# Zadanie 10 (Własna funkcja testująca kostkę)
# Napisz funkcję test_kostki(wektor_wynikow, alpha = 0.05), która:
#     Sprawdza testem chi-kwadrat, czy kostka jest uczciwa.
#     Rysuje wykres słupkowy z wartościami obserwowanymi i teoretycznymi.
#     Zwraca p-value oraz decyzję („odrzucamy H0” / „brak podstaw do odrzucenia H0”).
# Przetestuj ją na:
#     c(20, 20, 20, 20, 20, 20) (uczciwa)
#     c(40, 10, 10, 10, 10, 20) (nieuczciwa)
# Sugerowane funkcje: chisq.test, barplot, rep, list


test_kostki <- function(wektor_wynikow, alpha = 0.05) {
  # H0: test zgodności - kostka jest uczciwa
  # H1: kostka jest nieuczciwa
  test <- chisq.test(wektor_wynikow, p = rep(1 / 6, 6))
  if (test$p.value > alpha) {
    cat("Brak podstaw do odrzucenia H0\n")
  } else {
    cat("Odrzucamy H0\n")
  }

  teor <- rep(sum(wektor_wynikow) / 6, 6)

  porownanie <- rbind(wektor_wynikow, teor)
  rownames(porownanie) <- c("Obserwowane", "Oczekiwane")
  colnames(porownanie) <- 1:6
  porownanie

  barplot(porownanie, beside = TRUE,
          col = c("lightblue", "lightgreen"),
          legend.text = TRUE,
          args.legend = list(x = "topright"))
}

k1 <- c(20, 20, 20, 20, 20, 20)
k2 <- c(40, 10, 10, 10, 10, 20)

test_kostki(k1)
test_kostki(k2)
