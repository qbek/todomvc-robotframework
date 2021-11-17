*** Settings ***
Library   SeleniumLibrary


*** Test Cases ***
Browser pupeeter
    Open browser    http://google.com   firefox
    Sleep    5s
    Close browser