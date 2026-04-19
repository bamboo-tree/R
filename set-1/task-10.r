x <- runif(1000, 0, 1)
y <- runif(1000, 0, 1)

plot(x, y, las = 1, asp = 1)
rect(0, 0, 1, 1)

t <- seq(0, 2 * pi, length.out = 100)
x1 <- 0.5 + 0.5 * cos(t)
y1 <- 0.5 + 0.5 * sin(t)
lines(x1, y1, col = 3)

indeks <- which((x - 0.5)^2 + (y - 0.5)^2 <= 0.25)
indeks

plot(x[indeks], y[indeks], las=1, xlim=c(0,1), ylim=c(0,1), cex=0.5, col=4, asp=1) # nolint

pi_est <- 4 * length(indeks) / length(x)
pi_est
