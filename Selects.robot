*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can loose game
    ${variable} = "this is a string"
    Open browser     https://qbek.github.io/selenium-exercises/en/selects.html    firefox
    Maximize browser window
    Select from list by label    css:#question1 select     3
    Click element    css:#question1 button
    Element should be visible    css:.alert-danger
    Sleep    2s
    Close browser