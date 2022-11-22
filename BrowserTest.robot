*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Browser pupeeter
    Open browser    http://google.pl    firefox
    Sleep    2s
    Close browser
