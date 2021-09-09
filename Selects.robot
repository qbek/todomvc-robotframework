*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can loose the game
    Open browser     https://qbek.github.io/selenium-exercises/pl/selects.html    firefox
    Select from list by label     css:#question1 select     5
    Click element    css:#question1 button
    Element should be visible    css:.alert-danger
    Sleep    2s
    Close browser
