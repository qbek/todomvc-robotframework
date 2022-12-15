*** Settings ***
Library           SeleniumLibrary
Resource          ../pageobjects/new_todo_input.robot
Resource          ../pageobjects/todos_list.robot

*** Variables ***
${todoName} =     Nowe lepsze zadanie
${ACTIVE_FILTER} =    css:[href="#/active"]
${COMPLETED_FILTER} =    css:[href="#/completed"]

*** Keywords ***
User creates new todo
    Create todo    ${todoName}

User checks if new todo is listed
    Check if todo is listed    ${todoName}

User completes a todo
    Select Checkbox    ${TODO_COMPLETE_TOGGLE}

User checks if todo is marked as completed
    Element Attribute Value Should Be    ${TODO}    class    completed

User checks if completed todo is NOT on Active tab
    Click Element    ${ACTIVE_FILTER}
    Element Should Not Contain    ${TODOS_LIST}    ${todoName}

User checks if completed todo is on Completed tab
    Click Element    ${COMPLETED_FILTER}
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
