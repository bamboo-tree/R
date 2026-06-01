# Napisa¢ funkcj¦, która dla zadanej liczby wydobywa jej kt¡ cyfr¦.

cyfra <- function(x, n) {
  y <- as.character(abs(x)) # zamien na strin
  d <- substr(y,n,n)        # substring na pozycji n n, czyli znak pod n
  d2 <- as.numeric(d)       # zamien string na liczbe
  return (d2)
}
cyfra(123, 2)

library(benford.analysis)

extract.digits(c(1.33333, 123, 12), 3)
cyfra(c(123, 456, 789), 2)