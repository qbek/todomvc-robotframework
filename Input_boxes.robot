*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Handling inputs
    Open browser    https://qbek.github.io/selenium-exercises/basic_form.html    firefox
    Input text    css:#firstname     Jakub
    Input text    css:#lastname     Szewczyk
    Input text    css:#email     wp@wp.pl
    Sleep     2s
    Click Button   css:.btn-success
    Sleep     2s
    Element Text Should Be    css:#firstname-check     Jakub
    Element Text Should Be    css:#lastname-check     Szewczyk
    Element Attribute Value Should Be    css:.form-control-plaintext    value    wp@wp.pl
    Close browser