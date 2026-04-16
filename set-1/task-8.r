fibonacci <- function(n) {
  if (n <= 0) return(numeric(0))
  if (n == 1) return(1)
  if (n == 2) return(c(1, 1))

  fib <- c(1, 1)
  for (i in 3:n) {
    fib[i] <- fib[i - 1] + fib[i - 2]
  }

  fib
}

fibonacci(10)
