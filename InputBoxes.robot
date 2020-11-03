*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Input boxes handling
    Open browser    https://qbek.github.io/selenium-exercises/pl/basic_form.html    firefox
    Maximize browser window
    Input text    css:#firstname    Jakub
    Input text    css:#lastname    Szewczyk
    Input text    css:#email    jakub@wp.pl
    Sleep   2s
    Click element    css:form > button
    Sleep   2s
    Element text should be    css:#firstname-check     Jakub
    Element text should be    css:#lastname-check     Szewczyk
    Element attribute value should be    css:.form-control-plaintext    value     jakub@wp.pl
    Close browser