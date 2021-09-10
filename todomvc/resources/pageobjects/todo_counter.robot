*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${COUNTER} =     css:.todo-count

*** Keywords ***
Check if counter shows
    [Arguments]     ${expected}
    Element should contain     ${COUNTER}     ${expected}