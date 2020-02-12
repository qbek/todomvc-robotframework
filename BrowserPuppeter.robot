*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Browser puppetter
    Open browser    http://google.com    firefox
    Maximize browser window
    Sleep    5s
    Close browser