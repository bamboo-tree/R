dane <- rnorm(1000, 100, 16)

h <- hist(dane, breaks = 50, xlim = c(40, 160), freq = TRUE) 
h <- hist(dane, breaks = 50, xlim = c(40, 160), col = 4, freq = FALSE) # freq = FALSE dla wykresu gęstości # nolint
str(h)

curve(dnorm(x, 100, 16), from = 40, to = 160, lwd = 4, col = 6, add = TRUE)

breaks <- c(30, 50, 60, 70, 90, 110, 150, 160)
h2 <- hist(dane, breaks = breaks, xlim = c(40, 160), col = 3)

h2 <- hist(dane, breaks = breaks, xlim = c(40, 160), col = 3, freq = FALSE)
curve(dnorm(x, 100, 16), from = 40, to = 160, lwd = 4, col = 5, add = TRUE)

# NOTE:
# wykres częstości i gęstości zmiennej losowej
# freq = FALSE - wykres gęstości