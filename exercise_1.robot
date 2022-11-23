*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL} =          https://qbek.github.io/selenium-exercises/pl/basic_form.html
${FIRSTNAME_INPUT} =    css:#firstname
${FRISTNAME_CHECK} =    css:#firstname-check

*** Test Cases ***
User can enter his data
    Set Test Variable    ${firstname}    Kuba
    Set Test Variable    ${lastname}    Szewczyk
    Set Test Variable    ${email}    wp@wp.pl
    Open Browser    ${URL}    firefox
    Input Text    ${FIRSTNAME_INPUT}    ${firstname}
    Input Text    css:#lastname    ${lastname}
    Input Text    css:#email    ${email}
    Click Button    css:.btn-success
    Wait Until Element Is Visible    css:#firstname-check
    Element Should Contain    ${FRISTNAME_CHECK}    ${firstname}
    Element Should Contain    css:#lastname-check    ${lastname}
    Element Attribute Value Should Be    css:.form-control-plaintext    value    ${email}
    Sleep    2s
    Close Browser
