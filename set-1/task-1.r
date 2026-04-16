punkty_1_x <- c(1, 20, 40, 80)
punkty_1_y <- c(20, 30, 13, 25)
plot(punkty_1_x, punkty_1_y, type = "l", col = 2, add = TRUE, lwd = 4,
     xlim = c(-10, 100), ylim = c(0, 55),
     main = "wykres 1", xlab = "argumenty", ylab = "wartości")

punkty_2_x <- c(5, 40, 80)
punkty_2_y <- c(30, 20, 3)
lines(punkty_2_x, punkty_2_y, col = 4, lwd = 4)

punkty_3_x <- c(-5, 30, 90)
punkty_3_y <- c(50, 10, 40)
points(punkty_3_x, punkty_3_y, col = 6, lwd = 4)


# NOTE:
# plot    - rysowanie wykresu z punktów (x, y)
# lines   - rysowanie wykresu w postaci lini (NIE line!)
# points  - rysowanie wykresu w postaci punktów
