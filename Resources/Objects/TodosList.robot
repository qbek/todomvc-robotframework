*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${todo-list} =  css:.todo-list
${todo-list-items} =  css:.todo-list li


*** Keywords ***
Todo list contains
    [Arguments]  ${expected}
    Wait Until Element Contains  ${todo-list}  ${expected}

Todo list contains all
    [Arguments]  @{expected-list}
    FOR  ${todo}  IN  @{expected-list}
        Todo list contains  ${todo}
    END