*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can fill data form
    Open Browser    https://qbek.github.io/selenium-exercises/pl/basic_form.html    firefox
    Maximize Browser Window

    Input Text    css:#firstname    Jakub
    Input Text    css:#lastname    Szewczyk
    Input Text    css:#email    wp@wp.pl

    Sleep    2s

    Click Element    css:form button

    Element Text Should Be    css:#firstname-check    Jakub
    Element Text Should Be    css:#lastname-check    Szewczyk
    Element Attribute Value Should Be    css:.form-control-plaintext    value    wp@wp.pl

    Sleep    2s

    Close Browser
