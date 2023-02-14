*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Hello world scenario
    log    Hello world! 
    log    I'm Kuba

Browser puppetter
    Open Browser    https://google.com     firefox
    Sleep    3s
    Close Browser

