*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Open and close browser
    Open Browser    http://google.com    firefox
    Sleep    5s
    Close Browser