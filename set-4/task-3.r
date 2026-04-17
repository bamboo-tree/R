probka <- c(2.94, 4.7, 7.14, 7.34, 13.46, 10.22, 3.21, 13.85, 3.55, 6.6, 6.73,
            4.96, 10.27, 6.67, 4.5, 8.11, 7.48, 6.92, 12.4, 14.77)

# H0: próbka pochodzi z rozkładu wykładniczego, lambda = 0.2
test_1 <- ks.test(probka, "pexp", rate = 0.2)
test_1
# p-val < 0.05 - odrzuca to hipotezę H0
plot(ecdf(probka), col = 2)
curve(pexp(x, rate = 0.2), add = TRUE, col = 4)
# wykres qq dla H0
qqplot(qexp(ppoints(length(probka)), rate = 0.2), probka)
qqline(probka)

# H1: próbka pochodzi z rozkładu wykładniczego
est_lambd <- 1 / mean(probka)
test_2 <- ks.test(probka, "pexp", rate = est_lambd)
test_2
# p-val < 0.05 - odrzuca to hipotezę H1
plot(ecdf(probka), col = 2)
curve(pexp(x, rate = est_lambd), add = TRUE, col = 4)
# wykres qq dla H1
qqplot(qexp(ppoints(length(probka)), rate = est_lambd), probka)
abline(0, 1)

# H2: próbka pochodzi z rozkładu chi kwadrat 
test_3 <- ks.test(probka, "pchisq", df = mean(probka))
test_3
# p-val > 0.05 - potwierdza to hipotezę H2
plot(ecdf(probka), col = 2)
curve(pchisq(x, df = mean(probka)), add = TRUE, col = 4)
# wykres qq dla H2
qqplot(qchisq(ppoints(length(probka)), df = mean(probka)), probka)
abline(0, 1)

# H3: proóbka pochodzi z rozkładu jednostajnego na przedziale [2, 16]
test_4 <- ks.test(probka, "punif", min = 2, max = 16)
test_4
# p-val < 0.05 - odrzuca to hipotezę H3
plot(ecdf(probka), col = 2)
curve(punif(x, min = 2, max = 16), add = TRUE, col = 4)
# wykres qq dla H3
qqplot(qunif(ppoints(length(probka)), min = 2, max = 16), probka)
abline(0, 1)

# NOTE:
# test ks pozwala na sprawdzenie, czy próbka jest zgodna z jakimś rozkładem
# sprawdzanie rozkładów próbki