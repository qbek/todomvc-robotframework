# Wybór środowiska

Ważne jest, aby zmienne środowiskowe nie były zaszyte w teście, abyś mógł było ten sam test wykonać na wielu różnych środowiskach. Wszystkie dane środowiskowe trzymaj w osobnych plikach: [tutaj](https://github.com/qbek/todomvc-robotframework/tree/master/todomvc/Configuration) przykładowy katalog z plikami środowiskowymi. Warto takim plikom nadawać sensowne nazwy, np. rodzaj środowiska (dev, qa, uat), rodzaj przeglądarki...

W naszym przypadku pliki te mają nazwy odzwierciedlające testowana implementację (angular lub jquery), oraz użyta przeglądarka (firefox, chrom lub selenium grid)

```
--variable ENV:jquery-firefox
--variable ENV:angular-chrome
```

Nadal jednak masz możliwość nadpisania zmiennych środowiskowych z poziomy lini poleceń, np. podmiana domyślnej przeglądarki używanej na danym środowisku:

```
--variable ENV:angular-chrome  --variable BROWSER:firefox
```

# Dane testowe

Warto jest w swoich testach korzystać, gdzie tylko się da, z losowo generowanych danych. Są jednak środowiska, na których to jest niemożliwe (np. kliencie środowisku UAT). Na podobnej zasadzie jak wybór środowiska warto mieć możliwość łatwej podmiany używanych danych testowych.

W tym przykładzie dane testowe to nic innego jak dwa pliki robot (znajdziesz je w [tym katalogu](https://github.com/qbek/todomvc-robotframework/tree/master/todomvc/TestData)). Oba pliki muszą udostępniać takie same keywordy do generowania danych. Wybór odpowiedniego pliku do użycia odbywa się w następujący sposób:

Tam gdzie potrzebujesz użyć generatora danych:
```
*** Settings ***

Resource  ../TestData/${TEST_DATA}TestData.robot
```

Uruchamiając testy musisz ustawić dodatkową zmienną by wybrać odpowiedni generator:
```
--variable TEST_DATA:static
--variable TEST_DATA:random
```
