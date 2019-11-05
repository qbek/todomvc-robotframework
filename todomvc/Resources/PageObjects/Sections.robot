*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FILTERS} =    css:.filters
${ACTIVE_SECTION} =    ${FILTERS} [href="#/active"]
${COMPLETED_SECTION} =    ${FILTERS} [href="#/completed"]


*** Keywords ***
Switch to active section
    Click Element    ${ACTIVE_SECTION}
    Capture Page Screenshot

Switch to completed section
    Click Element    ${COMPLETED_SECTION}
    Capture Page Screenshot