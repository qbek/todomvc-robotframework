*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Browser puppetter
    Open browser    http://google.com    firefox
    Sleep    5s
    Close browser