*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can mix colors
    Open browser    https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox
    Select checkbox    css:[name="blue"]
    Select checkbox    css:[name="red"]
    Element attribute value should be     css:#light   data-color    \#FF00FF

    Sleep   1s
    Close browser

User can enable text area
    Open browser    https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox
    Element should be disabled    css:#text
    Click element    css:.custom-control-label
    Element shoudl be enabled     css:#text

    Sleep   1s
    Close browser