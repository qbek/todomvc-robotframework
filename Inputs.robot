*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can enter his data to form
    Open browser     https://qbek.github.io/selenium-exercises/en/basic_form.html    firefox
    Maximize browser window
    Input text    css:#firstname     Jakub
    Input text    css:#lastname     Szewczyk
    Input text    css:#email     jakub@jakub.p
    Click element    css:.btn-success
    Element text should be    css:#firstname-check    Jakub
    Element text should be    css:#lastname-check    Szewczyk
    Element attribute value should be    css:.form-control-plaintext    value     jakub@jakub.pl
    Sleep    2s
    Close browser