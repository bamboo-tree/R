ny <- c(3.8, 5.5, 9.9, 15.7, 21.5, 26.3)
la <- c(19.5, 19.4, 19.7, 20.8, 21.3, 22.7)
fw <- c(13.7, 15.4, 20.0, 24.6, 28.5, 32.7)

m <- 1:6

plot(0, 0, xlim = c(1, 6), ylim = c(0, 30), main = "Pierwsze półrocze",
     ylab = "Temperatura", xlab = "Miesiąc")

lines(m, ny, col = 1, lwd = 2)
lines(m, la, col = 2, lwd = 2)
lines(m, fw, col = 3, lwd = 2)
