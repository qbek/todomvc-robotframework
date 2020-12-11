*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Browser pupetter
    Open Browser    http://google.com    firefox
    Maximize Browser Window
    Sleep    5s
    Close Browser
