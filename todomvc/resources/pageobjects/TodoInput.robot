*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODO_INPUT} =     css:.new-todo


*** Keyword ***
Create a todo
    [Arguments]     ${name}
    Input text     ${TODO_INPUT}     ${name}
    Press keys     ${TODO_INPUT}     RETURN

Todo input is dispalyed
     Wait until page contains element     ${TODO_INPUT}