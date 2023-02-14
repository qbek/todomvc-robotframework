*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${ACTIVE_TAB} =     css:[href="#/active"]
${COMPLETED_TAB} =   css:[href="#/completed"]

*** Keywords ***
Goto Active filter
    Click Element     ${ACTIVE_TAB}

Goto Completed filter
    Click Button     ${COMPLETED_TAB}