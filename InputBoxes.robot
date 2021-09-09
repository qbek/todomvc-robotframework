*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User fill basic data
    Open browser    https://qbek.github.io/selenium-exercises/pl/basic_form.html    firefox
    Maximize Browser Window

    Input text     css:#firstname    Jakub
    Input text     css:#lastname     Szewczyk
    Input text     css:#email       jakub@wp.pl

    Sleep   1s
    Click element    css:.btn-success

    Element text should be    css:#firstname-check    Jakub
    Element text should be    css:#lastname-check    Szewczyk
    Element attribute value should be    css:.form-control-plaintext    value    jakub@wp.pl

    Sleep    1s
    Close browser
