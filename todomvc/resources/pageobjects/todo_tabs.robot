*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${ACTIVE_TODOS} =    css:[href="#/active"]
${COMPLETED_TODOS} =    css:[href="#/completed"]


*** Keywords ***
Switch to active todos tab
    Click element    ${ACTIVE_TODOS}
    Capture page screenshot

Switch to completed todos tab
    Click element    ${COMPLETED_TODOS}
    Capture page screenshot