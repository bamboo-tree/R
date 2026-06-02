# Roczne koszty utrzymania w 15 losowo wybranych publicznych koled»ach i w 10 prywatnych s¡ nast¦puj¡ce
# ( w ty±. dolarów)
# pub = c(4.2, 6.1, 4.9, 8.5, 4.6, 9.1, 7.7, 6.5, 6.2, 10.2, 11.6, 10.4, 5.0, 10.4, 8.1)
# priv = c(13.0, 18.8, 13.2, 14.4, 17.7, 17.7, 17.6, 19.8, 16.8, 16.1)
# Zwerykowa¢ hipotez¦ H0, »e ±redni roczny koszt utrzymania w prywatnym koled»u jest wi¦kszy o co najmniej
# 10 tys. dolarów od ±redniego rocznego kosztu utrzymania w publicznym koled»u.

pub <- c(4.2, 6.1, 4.9, 8.5, 4.6, 9.1, 7.7, 6.5, 6.2, 10.2, 11.6, 10.4, 5.0, 10.4, 8.1)
priv <- c(13.0, 18.8, 13.2, 14.4, 17.7, 17.7, 17.6, 19.8, 16.8, 16.1)

boxplot(pub, priv, col = c(2, 4))

summary(pub)
summary(priv)

# test normalności
shapiro.test(pub)
shapiro.test(priv)
# próby pochodzą z rozkładu normalnego

# równość wariancji
var.test(pub, priv)
# p-val > 0.05 : wariancje są równe

# H0: mu_priv == mu_pub + 10 <==> (mu_priv - mu_pub == 10)
# H1: mu_priv != mu_pub + 10
t.test(priv, pub, mu = 10, var.equal = TRUE)
# p-val > 0.05 : przyjmujemy H0

# H0: mu_priv == mu_pub + 10 <==> (mu_priv - mu_pub == 10)
# H1: mu_priv < mu_pub + 10
t.test(priv, pub, mu = 10, var.equal = TRUE, alternative = "less")
# p-val > 0.05 : przyjmujemy H0

# NOTE:
# różnica w średnich o wartość
# t.test z mu