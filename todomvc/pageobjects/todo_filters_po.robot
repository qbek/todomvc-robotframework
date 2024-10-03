*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FILTERS} =   css:#filters
${ACTIVE_TAB} =     ${FILTERS} [href="#/active"]
${COMPLETED_TAB} =   ${FILTERS} [href="#/completed"]


*** Keywords ***
Go to Active filter
    Click element    ${ACTIVE_TAB}

Go to Completed filter
    Click Element    ${COMPLETED_TAB}