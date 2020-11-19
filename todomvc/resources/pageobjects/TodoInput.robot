*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODO_INPUT} =     css:.new-todo


*** Keyword ***
Create a todo
    [Arguments]     ${name}
    Input text     ${TODO_INPUT}     ${name}
    Press keys     ${TODO_INPUT}     RETURN