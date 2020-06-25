*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${FILTERS} =   css:.filters
${ACTIVE_TODOS_FILTER} =   ${FILTERS} [href="#/active"]
${COMPLETED_TODOS_FILTER} =   ${FILTERS} [href="#/completed"]


*** Keywords ***
Switch to active todos filter
    Click element    ${ACTIVE_TODOS_FILTER}
    Capture page screenshot

Switch to completed todos filter
    Click element    ${COMPLETED_TODOS_FILTER}
    Capture page screenshot