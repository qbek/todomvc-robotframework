*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${todo-input} =  css:.new-todo

*** Keywords ***
Wait for todo input field
    Wait Until Element Is Visible  ${todo-input}

Add todo
    [Arguments]  ${title}
    Input Text  ${todo-input}  ${title}
    Press Keys  ${todo-input}  RETURN

Add todos
    [Arguments]  @{todos-to-add}
    FOR  ${todo}  IN  @{todos-to-add}
        Add todo  ${todo}
    END