# Koncern paliwowy reklamuje si¦, »e dodatek pewnego innowacyjnego skªadnika do jego paliwa zwi¦ksza
# przeci¦tny zasi¦g samochodu na jednym litrze benzyny. Przeprowadzono 12 testów zasi¦gu w tych samych
# warunkach eksperymentalnych przed dodaniem tego skªadnika otrzymuj¡c zasi¦g (w km):
# Z1 = c(14.285, 14.215, 14.198, 14.312, 14.347, 14.208, 14.305, 14.156, 14.214, 14.172, 14.273, 14.175)
# na 1 litr benzyny i po dodaniu do benzyny tego skªadnika, otrzymuj¡c zasi¦g (w km):
# Z2 = c(14.714, 14.586, 14.532, 14.412, 14.623, 14.514, 14.608, 14.567, 14.493, 14.341, 14.514, 14.298)
# na 1 litr paliwa. Zbada¢ na poziomie istotno±ci α = 0.05 czy informacje w reklamie mo»na uzna¢ za prawdziwe


Z1 <- c(14.285, 14.215, 14.198, 14.312, 14.347, 14.208, 14.305, 14.156, 14.214, 14.172, 14.273, 14.175)
Z2 <- c(14.714, 14.586, 14.532, 14.412, 14.623, 14.514, 14.608, 14.567, 14.493, 14.341, 14.514, 14.298)

boxplot(Z1, Z2, col = rainbow(2))
abline(h = mean(Z1), lwd = 2)
abline(h = mean(Z2), lwd = 2)

roznica <- Z2 - Z1
roznica

# test normalności
shapiro.test(roznica)
# p-val > 0.05 : różnica pochodzi z rozkładu normalnego

# H0: mu == 0 (Z2 = Z1)
# H1: mu < 0 (Z2 < Z1)
t.test(Z2, Z1, paired = TRUE, alternative = "less")
# p-val > 0.05 : przyjumujemy H0