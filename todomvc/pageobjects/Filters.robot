*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ACTIVE_TAB} =     css:[href="#/active"]
${COMPLETED_TAB} =   css:[href="#/completed"]


*** Keywords ***
Go to Active tab
    Click Element    ${ACTIVE_TAB}

Go to Completed tab
    Click Element    ${COMPLETED_TAB}