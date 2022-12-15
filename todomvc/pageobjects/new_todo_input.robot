*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${NEW_TODO} =     css:.new-todo

*** Keywords ***
Create todo
    [Arguments]    ${name}
    Input Text    ${NEW_TODO}    ${name}
    Press Keys    ${NEW_TODO}    RETURN

Wait until todo input visible
    Wait Until Element Is Visible    ${NEW_TODO}
