*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close browser


*** Test Cases ***
Fill form in the iFrame
    Open browser    https://qbek.github.io/selenium-exercises/en/iframe.html    firefox
    Maximize browser window
    Select frame   css:iframe
    Input text    css:#firstname    Jakub
    Input text    css:#lastname     Szewczyk
    Input text    css:#email      test@test.pl
    Click element     css:.btn-success
    Sleep     2s