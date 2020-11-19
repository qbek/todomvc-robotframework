*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ACTIVE_FILTER_TAB} =    css:[href="#/active"]
${COMPLETED_FILTER_TAB} =    css:[href="#/completed"]


*** Keywords ***
Switch to Active tab
    Click element    ${ACTIVE_FILTER_TAB}
    Capture page screenshot

Switch to Completed tab
    Click element    ${COMPLETED_FILTER_TAB}
    Capture page screenshot
