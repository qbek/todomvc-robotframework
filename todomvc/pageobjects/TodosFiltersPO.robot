*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${ACTIVE_FILTER} =    css:[href="#/active"]
${COMPLETED_FILTER} =    css:[href="#/completed"]


*** Keywords ***
Goto Active tab
    Click Element    ${ACTIVE_FILTER}
    Capture Page Screenshot

Goto Completed tab
    Click Element    ${COMPLETED_FILTER}
    Capture Page Screenshot