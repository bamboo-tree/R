# Zbiór rozwiązanych zadań z programowania w R

### Zrobione laboratoria

- Zestaw 1 - podstawy rysowania wykresów
- Zestaw 2 - rozkłady i bardziej zaawansowane wykresy
- Zestaw 3 - przeprowadzanie eksperymentów z rozkładami i testy `chisq.test`
- Zestaw 4 - porównywanie rozkładów próbki; `ks.test`, `shapiro.test`
- Zestaw 5 - analiza danych: `kruskal.test`, `ks.test`; test niezależności `chisq.test`
- **Kolokwium**
- Zestaw 6 - test Benforda, charakter losowy próbki

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

---

- Test Benforda `benford` wykorzysuje się m.in. do analizy pierwszych cyfr w liczbach

- Porównanie średnich `t.test` lub `tsum.test`

- Sprawdzając równość wariancji, najpierw trzeba określić czy dane pochodzą z rozkładu normalnego `shapiro.test`. Jeśli pochodzą można skorzystać z `var.test` lub `bartlett.test` (dla wielu wariancji). Jeśli nie pochodzą należy skorzystać z `levene.test`

- Analiza wariancji `aov` wymaga spełenienia warunków: rozkład normalny i równość wariancji

- Testy porównań wielokrotnych **post-hoc**, wykonujemy po fakcie, kiedy stwierdzimy brak równości średnich. Pozwala ocenić które grupy są odpowiedzialne za odrzucenie hipotezy. `pairwise.t.test`, `LSD.test`, `TukeyHSD` (wymagają analizy `aov`)

### Notebook LM:

1.  Badanie równości średnich
    Wybór odpowiedniego testu zależy od tego, czy próby są zależne, czy niezależne, oraz czy znane są ich parametry.

        Zmienne niezależne (dwie grupy):
            Najpierw należy sprawdzić normalność rozkładu (shapiro.test) oraz równość wariancji (var.test).
            Jeśli wariancje są równe, stosuje się t.test(x, y, var.equal = TRUE).
            Jeśli wariancje są różne, używa się t.test(x, y, var.equal = FALSE).
            W przypadku posiadania jedynie statystyk opisowych (średnia, odchylenie, liczność), stosuje się tsum.test z pakietu PASWR2.
        Zmienne zależne (np. pomiar „przed” i „po”):
            Badamy normalność różnic między pomiarami (shapiro.test(po - przed)).
            Wykonujemy test t-Studenta dla par z parametrem paired = TRUE: t.test(po, przed, paired = TRUE).

2.  Badanie wariancji
    Weryfikacja wariancji pozwala ocenić zmienność danych i jest kluczowa przed wyborem testu średnich lub analizą ANOVA.

        Jedna wariancja: Stosuje się varTest z pakietu EnvStats, porównując wariancję próby z założoną wartością sigma.squared.
        Dwie wariancje: Używa się funkcji var.test(x, y).
        Wiele wariancji (więcej niż dwie):
            Przy rozkładzie normalnym: bartlett.test.
            Przy braku normalności: leveneTest z pakietu car lub levene.test z pakietu lawstat.

3.  Testowanie losowości
    Do badania, czy ciąg danych ma charakter losowy, wykorzystuje się pakiet randtests:

        runs.test(x): Test serii sprawdza oscylacje wokół mediany.
        turning.point.test(x): Test punktów zwrotnych bada liczbę lokalnych ekstremów w ciągu.
        bartels.rank.test(x): Pozwala wykryć trendy lub systematyczne oscylacje w danych.

4.  Prawo Benforda
    Służy do sprawdzania, czy pierwsze cyfry znaczące liczb w zbiorze danych są zgodne z teoretycznym rozkładem Benforda (gdzie cyfra 1 pojawia się najczęściej, ok. 30%).

        Metoda ręczna: Wyodrębnienie pierwszej cyfry znaczącej, stworzenie tabeli liczności i porównanie z rozkładem teoretycznym za pomocą chisq.test.
        Pakiet benford.analysis:
            Funkcja benford(data, number.of.digits = 1) analizuje dane.
            Wynik weryfikuje się testem chi-kwadrat: chisq(b).
            Można również zbadać mantysę logarytmu dziesiętnego za pomocą testu Kołmogorowa-Smirnowa (ks.test), sprawdzając czy ma rozkład jednostajny U(0,1).

5.  Analiza wariancji (ANOVA)
    ANOVA służy do porównywania średnich w wielu grupach jednocześnie.

        Jednoczynnikowa (One-way ANOVA):
            Założenia: Wszystkie grupy muszą pochodzić z rozkładu normalnego (shapiro.test lub wykresy qqnorm) i mieć równe wariancje (bartlett.test).
            Wykonanie: Funkcja aov(wartość ~ grupa, data = dane).
            Analiza post-hoc: Jeśli ANOVA wykaże różnice (p<0.05), stosuje się testy porównań wielokrotnych: TukeyHSD, LSD.test lub pairwise.t.test, aby wskazać, które konkretnie grupy się różnią.
            W przypadku niespełnienia założeń stosuje się nieparametryczny test Kruskala-Wallisa: kruskal.test.
        Dwuczynnikowa (Two-way ANOVA):
            Bada wpływ dwóch czynników (np. dawka i sposób podania leku) oraz ich interakcję.
            Przygotowanie: Zmienne grupujące muszą być sformatowane jako czynniki: as.factor().
            Wstępna analiza: Można stworzyć zmienną interakcyjną interaction(czynnik1, czynnik2), aby sprawdzić normalność i wariancję w podgrupach.
            Model: aov(wartość ~ czynnik1 * czynnik2, data = dane). Symbol * oznacza uwzględnienie obu czynników oraz ich interakcji.
            Wizualizacja: interaction.plot pozwala graficznie ocenić, czy wpływ jednego czynnika zależy od poziomu drugiego.
