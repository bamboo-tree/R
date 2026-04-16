
t <- seq(0, 2 * pi, length.out = 100)
x <- cos(t)
y <- sin(t)

plot(x, y, type = "l", asp = 1,
     xlab = "x", ylab = "y", main = "Okrąg o środku (0,0) i promieniu 1")
abline(h = 0, v = 0, lty = 2, col = "gray")

# NOTE:
# Równanie parametryczne okręgu: x = r*cos(t), y = r*sin(t)
# r = 1, t od 0 do 2*pi
