foo <- function(x) {
  if (x >= 0) {
    x^2
  } else {
    x * (-1)
  }
}

x <- seq(-5, 5, 0.1)
y <- sapply(x, foo)
plot(x, y, type = "l")

# NOTE:
# sapply - pozwala zastosować funkcję dla wektora danych wejściowych