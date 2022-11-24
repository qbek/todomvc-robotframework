*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${NEW_TODO} =     css:.new-todo

*** Keywords ***
Wait for TodoMVC app to be ready
    Wait Until Element Is Visible    ${NEW_TODO}

Create todo
    [Arguments]    ${name}
    Input Text    ${NEW_TODO}    ${name}
    Press Keys    ${NEW_TODO}    RETURN
