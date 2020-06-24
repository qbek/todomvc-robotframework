*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Select favouirte radio station
    Open browser    https://qbek.github.io/selenium-exercises/radio_buttons.html    firefox
    Maximize browser window
    Select Radio Button    radio-select    rmffm
    Element attribute value should be    css:#rmffm-details a    href    https://www.rmf.fm    Invalid radio page url
    Close browser