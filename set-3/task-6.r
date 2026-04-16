losowania <- c(23, 6, 21, 24, 18, 11, 0, 33, 35, 16, 7, 28, 21, 27, 18, 6, 26,
               31, 35, 13, 27, 0, 25, 4, 19, 17, 27, 4, 5, 33, 7, 26, 25, 16,
               21, 0, 9, 6, 6, 30, 7, 1, 23, 19, 1, 13, 8, 2, 2, 22, 19, 23,
               11, 10, 17, 2, 26, 16, 15, 8, 12, 31, 13, 19, 15, 10, 19, 23,
               24, 27, 15, 30, 17, 22, 17, 33, 26, 34, 8, 6, 4, 27, 19, 21, 26,
               4, 9, 7, 15, 30, 12, 9, 5, 23, 22, 18, 1, 17, 36, 1)

# przygotowanie tabeli z pogrupowanymi probkami
tab <- table(factor(x = losowania, levels = 0:36))
tab

# H0: ruletka jest uczciwa, czyli każdy numer ma równe prawodopodobieństwo
#     wylosowania

test <- chisq.test(tab, p = rep(1 / 37, 37))
test

if (test$p.value >= 0.05) {
  cat("Test potwierdza hipotezę H0, ruletka jest uczciwa")
} else {
  cat("Test odrzuca hipotezę H0, rulteka jest nie uczciwa")
}


# NOTE:
# uczciwa ruletka
# grupowanie próbek w tabelę