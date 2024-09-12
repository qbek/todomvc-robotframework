*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# selectory
${NEW_TODO_INPUT} =     css:#new-todo

*** Keywords ***
# atomowe akcje
Enter todo name
    [Arguments]   ${name}
    Input Text    ${NEW_TODO_INPUT}    ${name}

Submit todo
    Press Keys    ${NEW_TODO_INPUT}    RETURN