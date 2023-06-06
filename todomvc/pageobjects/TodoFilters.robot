*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${ACITVE_TODOS_FILTER} =   css:.filters [href="#/active"]
${COMPLETED_TODOS_FILTER} =   css:.filters [href="#/completed"]



*** Keywords ***
Go to active filter
    Click Element    ${ACITVE_TODOS_FILTER}

Go to completed filter
    Click Element    ${COMPLETED_TODOS_FILTER}