*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Browser pupetter
    Open Browser    http://google.com    chrome
    Set window size    800    600
    Sleep    5s
    Close Browser