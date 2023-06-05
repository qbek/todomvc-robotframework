*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
User can enter his data
    Open Browser   https://qbek.github.io/selenium-exercises/pl/basic_form.html   chrome
    Input Text   css:#firstname   Jakub
    Input Text   css:#lastname    Szewczyk
    Input Text   css:#email       wp@wp.pl

    Click Element   css:.btn-success
    Wait Until Element Is Visible    css:.card-body > .btn-warning
    Element Text Should Be    css:#firstname-check    Jakub
    Element Text Should Be    css:#lastname-check    Szewczyk
    Element Attribute Value Should Be    css:.form-control-plaintext   value   wp@wp.pl

    Sleep   2s
    Close Browser

