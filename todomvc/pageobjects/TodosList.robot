*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_COMPLETE_TOGGLE} =     css:.todo-list .toggle
${TODO_ITEM} =                css:.todo-list li

*** Keywords ***
Complete todo
    Select Checkbox    ${TODO_COMPLETE_TOGGLE}

Verify if todo has class completed
    Element Attribute Value Should Be    ${TODO_ITEM}    class   completed

Verify todo is on the list
    [Arguments]   ${todoName}
    Element Text Should Be     ${TODOS_LIST}    ${todoName}


Verify todo is not on the list
    [Arguments]   ${todoName}
    Element Text Should Not Be     ${TODOS_LIST}    ${todoName}