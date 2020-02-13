*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${NEW_TODO_INPUT} =    css:.new-todo


*** Keywords ***
Add todo
    [Arguments]    ${todo_name}
    Input text    ${NEW_TODO_INPUT}    ${todo_name}
    Press keys    ${NEW_TODO_INPUT}    RETURN
    Capture element screenshot   css:.todoapp

Is create todo input displayed
    Wait until page contains element    ${NEW_TODO_INPUT}
    Capture element screenshot   css:.todoapp