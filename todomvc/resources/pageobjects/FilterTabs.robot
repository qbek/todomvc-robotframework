*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${ACTIVE_FILTER} =    css:.filters [href="#/active"]
${COMPLETED_FILTER} =    css:.filters [href="#/completed"]



*** Keywords ***
Go to Active tab
    Click Element    ${ACTIVE_FILTER}
    Capture Page Screenshot

Go to Completed tab
    Click Element    ${COMPLETED_FILTER}
    Capture Page Screenshot
