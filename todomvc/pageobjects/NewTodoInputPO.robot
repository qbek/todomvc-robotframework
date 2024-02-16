*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${NEW_TODO_INPUT} =     css:#new-todo

*** Keywords ***
Enter todo name
    [Arguments]   ${name}
    Input Text    ${NEW_TODO_INPUT}    ${name}

Submit todo
    Press Keys    ${NEW_TODO_INPUT}    RETURN
    Capture Page Screenshot