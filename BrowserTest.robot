*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Test title
    Open browser    http://google.pl    firefox
    Sleep    5s
    Close browser
