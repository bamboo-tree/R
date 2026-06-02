# Badamy trzy odmiany pszenicy oraz trzy rodzaje nawozu. Plony zebrane z pól do±wiadczalnych s¡ nast¦puj¡ce
# (w tonach na hektar)
# Nawóz 1 Nawóz 2 Nawóz 3
# Pszenica 1 4.5, 4.9, 5.4 5.2, 5.4, 5.9 5.3, 5.5, 5.8
# Pszenica 2 4.7, 5.1, 5.8 5.6, 6.1, 5.7 5.1, 5.0, 5.6
# Pszenica 3 5.1, 6.0, 5.7 5.2, 4.8, 5.5 5.2, 5.3, 5.9
# Zwerykowa¢ hipotezy:
# (a) warto±ci ±rednie plonów dla ro»nych odmian nie ró»ni¡ si¦ istotnie niezale»nie od stosowanego nawozu,
# (b) warto±ci ±rednie plonów dla ro»nych nawozów nie ró»ni¡ si¦ istotnie niezale»nie od odmiany,
# (c) miedzy odmianami i nawozami nie zachodzi interakcja.
# Dane umieszczone s¡ w ramce danych csv-10(Pszenica)

R1 <- read.csv2("set-10/pszenica.csv", header=TRUE)
View(R1)

interaction(c("a", "b", "c"), c(1,3,5), sep="-")
R1$Iloczyn <- with(R1, interaction(Pszenica, Nawoz, sep="-"))
View(R1)
g <- table(R1$Plony, R1$Iloczyn)
g

# normalność
by(R1$Plony, R1$Iloczyn, shapiro.test)
# p-val > 0.05 : przyjmujemy H0, próby pochodzą z rozkładu normalnego

# równość wariancji
bartlett.test(Plony~Iloczyn, data=R1)
# p-val > 0.05 : przyjmujemy równość wariancji

boxplot(Plony~Pszenica, data=R1)
boxplot(Plony~Nawoz, data=R1)
plot.design(R1)

summary(R1)
R1$Pszenica <- as.factor(R1$Pszenica)
R1$Nawoz <- as.factor(R1$Nawoz)
plot.design(R1[,c("Pszenica", "Nawoz", "Plony")])

# analiza wiarancji dwuczynnikowa
analiza2 <- aov(Plony~Nawoz*Pszenica, data=R1)
summary(analiza2)
# przyjmujemy hipotezy H0(a), H0(b), H0(ab)
# rodzaj zastosowanego nawozu nie ma instotnego wpływu na wielkość plnów
# odmiana pszenicy nie ma statystycznego wpływu na wielkość plonów
# interakcja jest nieistotna, oznacza to że żadna konkretna odmiana pszenicy nie 
# reaguje wyjątkowo dobrze, ani wyjątkowo dobrze na żaden konkrtny rodzaj nawozu

interaction.plot(R1$Pszenica, R1$Nawoz, R1$Plony)

# NOTE:
# analiza wariancji
# iloczyn zbiorów
# as.factor