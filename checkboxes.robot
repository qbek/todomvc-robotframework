*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Check light color
    Open browser    https://qbek.github.io/selenium-exercises/check_boxes.html    firefox
    Maximize browser window
    Wait until page contains element    css:#text
    Click element    css:[name="red"]
    Select checkbox    css:[name="blue"]
    Element attribute value should be    css:#light    data-color    \#FF00FF
    Sleep    2s
    Close browser

Element can be enabled
    Open browser    https://qbek.github.io/selenium-exercises/check_boxes.html    firefox
    Maximize browser window
    Wait until page contains element    css:#text
    Click element     css:[for="switch"]
    Element should be enabled    css:#text
    Sleep     2s
    Close browser