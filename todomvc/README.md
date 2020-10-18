#Wybór środowiska

Ważne jest, aby zmienne środowiskowe nie były zaszyte w teście, abyś mógł było ten sam test wykonać na wielu różnych środowiskach. Wszystkie dane środowiskowe trzymaj w osobnych plikach: [tutaj](https://github.com/qbek/todomvc-robotframework/tree/master/todomvc/Configuration) przykładowy katalog z plikami środowiskowymi. Warto takim plikom nadawać sensowne nazwy, np. rodzaj środowiska (dev, qa, uat), rodzaj przeglądarki...

W naszym przypadku pliki te mają nazwy odzwierciedlające testowana implementację (angular lub jquery), oraz użyta przeglądarka (firefox, chrom lub selenium grid)

```
robot --variable ENV:jquery-firefox Tests/Adding_todo.robot
robot --variable ENV:angular-chrome Tests/Adding_todo.robot
```

Nadal jednak masz możliwość nadpisania zmiennych środowiskowych z poziomy lini poleceń, np. podmiana domyślnej przeglądarki używanej na danym środowisku:

```
robot --variable ENV:angular-chrome  --variable BROWSER:firefox Tests/Adding_todo.robot
```
