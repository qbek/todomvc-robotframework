*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Light color test
    Open browser    https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox
    Select checkbox     css:[name="red"]
    Select checkbox     css:[name="blue"]
    Element attribute value should be     css:#light     data-color     \#FF00FF
    Sleep    1s
    Close browser

Comments enabling test
    Open browser    https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox
    Element should be disabled   css:#text
    Click element     css:.custom-control-label
    Sleep     1s
    Element should be enabled   css:#text
    Close browser
