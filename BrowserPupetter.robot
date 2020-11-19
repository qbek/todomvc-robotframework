*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Open the borwser
    Open browser     http://google.com     firefox
    Maximize browser window
    Sleep    5s
    Close browser