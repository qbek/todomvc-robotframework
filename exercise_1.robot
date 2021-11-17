*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can enter his personal data
    Open browser    https://qbek.github.io/selenium-exercises/pl/basic_form.html    firefox
    Input text     css:#firstname     Jakub
    Input text     css:#lastname    Szewczyk
    Input text     css:#email     js@hot.com
    Click element    css:.btn-success

    Element text should be    css:#firstname-check     Jakub
    Element text should be    css:#lastname-check     Szewczyk
    Element attribute value should be    css:.form-control-plaintext    value    js@hot.com

    Sleep    5s
    Close browser