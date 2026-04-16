liczebnosc <- c(1, 16, 26, 19, 20, 18)
sr <- c((61 + 67) / 2, (67 + 69) / 2, (69 + 71) / 2, (71 + 73) / 2, (73 + 75) / 2, (75 + 81) / 2) # nolint
sr

granice <- c(61, 67, 69, 71, 73, 75, 81)

# szacowanie parametrow m i sigma dla rozkładu normalnego
m <- weighted.mean(sr, liczebnosc)
m
s <- sqrt(sum(liczebnosc * ((sr - m) ^ 2)) / (sum(liczebnosc) - 1))
s

# oblicanie prawdopodobiestwa teoretycznego
pr_teor <- diff(pnorm(granice, m, s))
pr_teor <- pr_teor / sum(pr_teor) # jeśli prawdopodobienstwo nie sumuje się do 1
pr_teor
sum(pr_teor)

test <- chisq.test(liczebnosc, p = pr_teor)
test

# NOTE:
# estymowanie parametrow do rozkładu normalnego m i sigma
# liczenie prawdopodobienstwa na przedziałach