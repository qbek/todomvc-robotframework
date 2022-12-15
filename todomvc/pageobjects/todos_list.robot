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
