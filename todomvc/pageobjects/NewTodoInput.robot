*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${NEW_TODO_INPUT} =    css:.new-todo


*** Keywords ***
Create todo
    [Arguments]   ${todoName}
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press Keys    ${NEW_TODO_INPUT}    RETURN

Wait for new todo input to be rendered
    Wait Until Element Is Visible    ${NEW_TODO_INPUT}