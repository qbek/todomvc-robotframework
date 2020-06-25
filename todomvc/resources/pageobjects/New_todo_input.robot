*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${NEW_TODO_INPUT} =    css:.new-todo


*** Keywords ***
Add a todo
    [Arguments]    ${todo_name}
    Input text   ${NEW_TODO_INPUT}    ${todo_name}
    Press keys    ${NEW_TODO_INPUT}    RETURN
    Capture page screenshot

New todo input is displayed
    Wait until page contains element    ${NEW_TODO_INPUT}