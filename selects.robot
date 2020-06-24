*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can loose game
    Open browser    https://qbek.github.io/selenium-exercises/selects.html    firefox
    Maximize browser window
    Select from list by label    css:#question1 select     5
    Click element    css:#question1 button
    Element should be visible    css:.alert-danger
    Close browser