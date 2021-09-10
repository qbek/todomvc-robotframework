*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ACTIVE_TAB} =    css:[href="#/active"]
${COMPLETED_TAB} =    css:[href="#/completed"]



*** Keywords ***
Switch to Active filter
    Click element     ${ACTIVE_TAB}

Switch to Completed filter
    Click element     ${COMPLETED_TAB}