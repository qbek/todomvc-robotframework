*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =         css:.todo-list li
${TODO_COMPLETE_TOGGLE} =    css:.toggle

*** Keywords ***
Check if todo is listed
    [Arguments]    ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

Check if todo is NOT listed
    [Arguments]    ${name}
    Element Should Not Contain    ${TODOS_LIST}    ${name}

Complete todo
    Select Checkbox    ${TODO_COMPLETE_TOGGLE}

Check if todo completed
    Element Attribute Value Should Be    ${TODO}    class    completed


