# Dla 7 losowo wybranych ro±lin chmielu wykonano nast¦puj¡ce do±wiadczenie: zapylono jedn¡ poªow¦ ka»-
# dej ro±liny, drug¡ poªow¦ pozostawiono niezapylon¡. Plon nasion ro±lin chmielu przedstawiono w tabeli (w
# gramach na 10)
# nr ro±liny 1 2 3 4 5 6 7
# zapylona 0.78 0.76 0.43 0.92 0.86 0.59 0.68
# niezapylona 0.21 0.12 0.32 0.29 0.30 0.20 0.14
# Czy mo»na uzna¢, »e zapylona cz¦±¢ ro±liny daje wy»szy plon ni» niezapylona?
# przed = c(0.21, 0.12, 0.32, 0.29, 0.30, 0.20, 0.14) # niezapylona
# po = c(0.78, 0.76, 0.43, 0.92, 0.86, 0.59, 0.68) # zapylona

przed <- c(0.21, 0.12, 0.32, 0.29, 0.30, 0.20, 0.14) # niezapylona
po <- c(0.78, 0.76, 0.43, 0.92, 0.86, 0.59, 0.68) # zapylona

# test normalności
shapiro.test(przed)
shapiro.test(po)
# dane pochodzą z rozkładu normlanego

# test wairancji
var.test(przed, po)
# wariancje są równe

# H0: mu po == mu przed (mu po - mu przed = 0)
# H1: mu po < mu przed (mu po - mu przed < 0) => alternative = "less" ktoś to czyta wgl?
t.test(po, przed, paired = TRUE, var.equal = TRUE, alternative = "less")
# p-val > 0.05 : przyjmujemy H0, średnie są takie same