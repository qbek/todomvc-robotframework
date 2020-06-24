*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Open and close browser
    Open browser    http://google.com    firefox
    Maximize browser window
    Sleep     5s
    Close browser