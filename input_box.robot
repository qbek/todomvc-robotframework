*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Check data from web form
    Open browser    https://qbek.github.io/selenium-exercises/basic_form.html    firefox
    Maximize browser window
    Wait until page contains element    css:#firstname
    Input text    css:#firstname    Jakub
    Input text    css:#lastname     Rambo
    Input text    css:#email    rambo@wp.pl
    Click element    css:[type="submit"]
    Element text should be    css:#firstname-check    Jakub
    Element text should be    css:#lastname-check    Rambo
    Element attribute value should be    css:#collapse-check input    value    rambo@wp.pl
    Sleep    5s
    Close browser