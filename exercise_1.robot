*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
User can save his personal data
    Open Browser    https://qbek.github.io/selenium-exercises/pl/basic_form.html    firefox
    Input Text    css:#firstname    Kuba
    Input Text    css:#lastname    Szewczyk
    Input Text    css:#email    wp@wp.pl
    Click Element    css:.btn-success
    Wait Until Element Is Visible    css:#firstname-check
    Element Text Should Be    css:#firstname-check    Kuba
    Element Text Should Be    css:#lastname-check    Szewczyk
    Element Attribute Value Should Be    css:.form-control-plaintext    value    wp@wp.pl
    Close Browser
