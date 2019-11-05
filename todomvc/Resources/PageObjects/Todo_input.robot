*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODO_INPUT} =    css:.new-todo

*** Keywords ***
Add todo
    [Arguments]    ${todo_to_add}
    Input Text    ${TODO_INPUT}    ${todo_to_add}
    Press Keys    ${TODO_INPUT}    ENTER
    Capture Page Screenshot

Wait for todo input
    Wait Until Page Contains Element    ${TODO_INPUT}
    Capture Page Screenshot