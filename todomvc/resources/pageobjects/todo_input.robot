*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODO_INPUT} =    css:.new-todo


*** Keywords ***
Create new todo
    [Arguments]    ${name}
    Input text    ${TODO_INPUT}     ${name}
    Press keys    ${TODO_INPUT}    RETURN