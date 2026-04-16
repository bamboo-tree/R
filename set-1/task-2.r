plot(0, 0, asp = 1, type = "n", xlim = c(-100, 100), ylim = c(-100, 100))

abline(0, 1, col = 1)
abline(0, 2, col = 2)
abline(0, 3, col = 3)
abline(0, 4, col = 4)
abline(0, 5, col = 5)
abline(2, 1, col = 6)

abline(h = 30, col = 7)

abline(v = -20, col = 8)
abline(v = 0, col = 9)
abline(v = 20, col = 10)
abline(v = 50, col = 11)
abline(v = 150, col = 12)


# NOTE:

# abline - pozwala na rysowanie funkcji liniowych oraz
# prostych pionowych i poziomych

# w celu przygotowania pustego wykresu można stworzyć
# plot typu "n" o odpowiednich wymiarach