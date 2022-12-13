*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Hello world
    log    I'm Jakub    console=True
    log    Hello world

Browser puppeteer
    Open Browser    http://google.pl    chrome
    # Sleep    3s
    Close Browser
