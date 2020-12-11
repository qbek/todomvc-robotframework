*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${NEW_TODO_INPUT} =    css:.new-todo


*** Keywords ***
Create todo
    [Arguments]   ${todoName}
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press Keys    ${NEW_TODO_INPUT}    RETURN
    Capture Page Screenshot

Wait for application is ready
    Wait Until Page Contains Element    ${NEW_TODO_INPUT}
    Capture Page Screenshot
