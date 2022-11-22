*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
User can enter his data
    Open Browser    https://qbek.github.io/selenium-exercises/pl/basic_form.html    firefox
    Input Text    css:#firstname    Kuba
    Input Text    css:#lastname    Szewczyk
    Input Text    css:#email    wp@wp.pl
    Click Button    css:.btn-success
    Wait Until Element Is Visible    css:#firstname-check
    Element Should Contain    css:#firstname-check    Kuab
    Element Should Contain    css:#lastname-check    Szewczyk
    Element Attribute Value Should Be    css:.form-control-plaintext    value    wp@wp.pl
    Sleep    2s
    Close Browser
