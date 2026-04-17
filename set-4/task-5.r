miasto <- c(2, 8, 12, 15, 20, 24, 21, 17, 13, 10, 5, 3, 0, 0)
wies <- c(0, 0, 5, 10, 14, 20, 26, 34, 27, 22, 18, 12, 8, 4)

# H0: pojemność płuc dzieci na wsi i w mieście ma taki sam rozkad

# do testy Kołmogorowa Smiergowa (K-S) potrzebujemy niezgrupowanej próby
# odtwarzamy próbę

poj <- seq(3150, 4450, 100)

miasto_2 <- rep(poj, miasto)
wies_2 <- rep(poj, wies)

# liczebność się zgadza
sum(miasto); sum(wies)
length(miasto_2); length(wies_2)

test <- ks.test(miasto_2, wies_2)
test
# p-val < 0.05: hipoteza H0 jest odrzucona

plot(ecdf(miasto_2))
lines(ecdf(wies_2), col = 2)

qqplot(miasto_2, wies_2, asp = 1)
abline(0, 1, col = 3)

stripchart(list(miasto_2, wies_2), method = "jitter", jitter = 0.2)

# NOTE:
# zamiana danych zgrupowanych na dane ilościowe
# porównanie rozkładu w próbce