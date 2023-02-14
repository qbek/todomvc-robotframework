*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${NEW_TODO_INPUT} =    css:.new-todo


*** Keywords ***
Create new todo
    [Arguments]     ${name}
    Input Text    ${NEW_TODO_INPUT}    ${name}
    Press keys    ${NEW_TODO_INPUT}    RETURN
    Capture Page Screenshot

Wait until todo input is renderd
    Wait Until Element Is Visible     ${NEW_TODO_INPUT}
    Capture Page Screenshot

