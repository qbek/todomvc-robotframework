*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Hello world       
    Log   I'm Kuba     console=True

Browser pupeteer
    Open Browser    http://google.com     Firefox
    Sleep     5s
    Close Browser