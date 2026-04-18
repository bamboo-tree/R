# Na podstawie poni»szej tabeli kontyngencji zbada¢, czy cechy X i Y s¡ statystycznie niezależne # nolint

m <- rbind(
  c(2, 3, 8),
  c(6, 5, 20)
)
colnames(m) <- c("y1", "y2", "y3")
rownames(m) <- c("x1", "x2")
m
str(m)

# H0: Cechy X i Y są niezależne (brak związku)
# H1: Cechy X i Y są zależne (istnieje związek)

test <- chisq.test(m)
test
# p-value > 0.05 - wartości są niezależne

barplot(m, beside = TRUE, col = c("blue", "red"),
        legend.text = rownames(m))
