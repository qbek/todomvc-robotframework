*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Start todomvc app
    Open browser    ${TODOMVC_URL}    ${BROWSER}
    Maximize browser window

Stop todomvc app
    Close browser


