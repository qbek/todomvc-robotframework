*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${ACTIVE_TAB} =    css:[href="#/active"]
${COMPLETED_TAB} =    css:[href="#/completed"]

*** Keywords ***
Go to Active Tab
    Click element    ${ACTIVE_TAB}

Go to Completed Tab
    Click Element    ${COMPLETED_TAB}
