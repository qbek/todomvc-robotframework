*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =         css:.todo-list li
${COMPLETE_TODO} =    css:.toggle

*** Keywords ***
Todo is on the list
    [Arguments]    ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

Todo is NOT on the list
    [Arguments]    ${name}
    Element Text Should Not Be    ${TODOS_LIST}    ${name}

Complete todo
    Select Checkbox    ${COMPLETE_TODO}

Check if todo marked as completed
    Element Attribute Value Should Be    ${TODO}    class    completed
