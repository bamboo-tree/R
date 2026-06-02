# Pewna rma farmaceutyczna przetestowaªa dziaªanie nowego leku na 20 losowo wybranych pacjentach. Celem
# leku jest obni»enie poziomu pewnego skªadnika X we krwi. Wyniki badania przed podaniem i po podaniu
# leku s¡ nast¦puj¡ce (w odpowiednich jednostkach dla ustalonej obj¦to±ci krwi)
# przed =c(179, 131, 188, 126, 162, 192, 174, 191, 161, 149, 155, 186, 213, 158, 192, 186, 169, 169, 185, 141);
# po =c(145, 166, 179, 189, 155, 163, 168, 141, 143, 169, 153, 148, 167, 185, 173, 180, 173, 162, 178, 159).
# Czy mo»na wnioskowa¢, »e lek obni»a ±rednio poziom X?

przed <- c(179, 131, 188, 126, 162, 192, 174, 191, 161, 149, 155, 186, 213, 158, 192, 186, 169, 169, 185, 141)
po <- c(145, 166, 179, 189, 155, 163, 168, 141, 143, 169, 153, 148, 167, 185, 173, 180, 173, 162, 178, 159)

boxplot(przed, po, col = c(2, 4))
abline(h = mean(przed), lwd = 2)
abline(h = mean(po), lwd = 4)

roznica <- po - przed
roznica

# czy róznica pochodzi z rozkładu normalnego?
shapiro.test(roznica)
# p-val > 0.05 : różnica pochodzi z rozkładu normalnego

# H0: mu_roznica = 0 <==> (mu_po - mu_przed = 0)
# H1: mu_roznica < 0 <==> (mu_po - mu_przed < 0)
t.test(po, przed, paired = TRUE, alternative = "less") # paired - zmienne zależne 
# p-val > 0.05 : przyjmujemy H0

# NOTE:
# średnia wartość przed i po
# badanie leku
# zmienne zależne
# różnica w działaniu
