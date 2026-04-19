# Zadanie 6 (CTP – Centralne Twierdzenie Graniczne)
# Zasymuluj 500 razy sumę S = X1 + ... + X20, gdzie każda zmienna pochodzi z rozkładu jednostajnego U(0, 1).
#     Narysuj histogram sum.
#     Na histogramie nałóż krzywą gęstości rozkładu normalnego o średniej 20*0.5 i wariancji 20*(1/12).
#     Sprawdź testem Shapiro-Wilka, czy rozkład sum jest normalny.
# Sugerowane funkcje: replicate, runif, hist, curve, dnorm, shapiro.test