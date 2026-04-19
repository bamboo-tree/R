# Zbiór rozwiązanych zadań z programowania w R

### Zrobione laboratoria

- Zestaw 1 - podstawy rysowania wykresów
- Zestaw 2 - rozkłady i bardziej zaawansowane wykresy
- Zestaw 3 - przeprowadzanie eksperymentów z rozkładami i testy `chisq.test`
- Zestaw 4 - porównywanie rozkładów próbki; `ks.test`, `shapiro.test`
- Zestaw 5 - analiza danych: `kruskal.test`, `ks.test`; test niezależności `chisq.test`
- **Kolokwium**

### Notatki:

- `chisq.test` - Pozwala sprawdzić, czy dany rozkład warości odpowiada konkretnym prawdopodobieństwom, np: czy kostka jest uczciwa, czy próbka zgadza się z szacowanym prawdopodobieństwem.

- W rozkładzie **Poissona**, trzeba zwrócić uwagę na liczebność próbek w zbiorach (jeśli ostatnie liczebności są małe, trzeba je zgrupować i zmodyfikować kategorie).

- Dla **Poissona** szacowanie lambda:<br>
  `lambda <- weighted.mean(xi, ni)`

- Dla **dwumianowego** szacowanie p:<br>
  `p <- weighted.mean(xi, ni) / sum(ni)`

- Dla **normalnego** szacowanie m i sigma:<br>
  `m <- weighted.mean(mids, ni)`,<br>
  `sigma <- sqrt(sum(ni * ((mids - m) ^ 2)) / (sum(ni) - 1))`

> **_NOTE:_** `ni` liczebność próbki, `xi` - kategorie (przedziały)

- `shapiro.test` - Pozwala sprawdzić, czy próbka pochodzi z **rozkładu normalnego**.

- Wykresy **Q-Q** pokazują, czy próbka ma rozkład liniowy, dobre do testu Shapiro.

- `ks.test` - Pozwala sprawdzić, czy próbka jest zgodna z jakimś rozkładem lub czy dwie próbki podobny rozkład. Nie dla rozkładów dyskretnych (np. Poissona).

- `kruskal.test` - Pozwala sprawdzić, czy kilka zbiorów próbek ma podobny rozkład.

> **_NOTE:_** `ks.test` pozwala porównać tylko dwie próbki

- `chisq.test` - **Test niezależeności**. Pozwala sprawdzić czy dane w postaci macierzy są od siebie niezależne.

- Hipoteza zerowa jest przyjomowana jeśli **p value > 0.05**
