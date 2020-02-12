*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Check light color
    Open browser    https://qbek.github.io/selenium-exercises/radio_buttons.html    firefox
    Maximize browser window
    Wait until page contains element    css:.card
    Select Radio Button    radio-select    rmffm
    Element attribute value should be    css:#rmffm-details a    href    https://www.rmf.fm
    Close browser
