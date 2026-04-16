moje <- c(2, 13, 9, 6, 7, 40)
sekret <- round(runif(n = 6, min = 1, max = 49), 0)
trafienia <- intersect(moje, sekret)

cat("Moje", moje, "\n")
cat("Losowanie", sekret, "\n")
cat("Trafienia", trafienia, "\n")


# NOTE:
# możliwe są operacje na zbiorach np. intersect jako część wspólna