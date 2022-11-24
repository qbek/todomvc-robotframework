*** Settings ***
Library           SeleniumLibrary
Resource          ../pageobjects/TodoInput.robot
Resource          ../pageobjects/TodoFilters.robot

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${TODOS_LIST} =    css:.todo-list
${TODO} =         css:.todo-list li
${COMPLETE_TODO} =    css:.toggle

*** Keywords ***
User creates a new todo
    Set Test Variable    ${todoName}    Moje pierwsze zadanie
    Create todo    ${todoName}

User checks if todo was created
    Element Text Should Be    ${TODOS_LIST}    ${todoName}

User completes the todo
    Select Checkbox    ${COMPLETE_TODO}

User checks if todo is completed
    Element Attribute Value Should Be    ${TODO}    class    completed

User checks if todo is NOT on Active tab
    Go to Active Tab
    Element Text Should Not Be    ${TODOS_LIST}    ${todoName}

User checks if todo is on Completed tab
    Go to Completed Tab
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
