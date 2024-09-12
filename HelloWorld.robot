*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Hello world
    log    Helo, I'm Kuba    console=True
    Log To Console   to do konsoli
    

Browser pupetter
    Open Browser   https://google.com    firefox
    Sleep    5s
    Close Browser
    