*** Settings ***
Resource          ../pageobjects/TodoInput.robot
Resource          ../pageobjects/TodoFilters.robot
Resource          ../pageobjects/TodosList.robot

*** Keywords ***
User creates a new todo
    Set Test Variable    ${todoName}    Moje pierwsze zadanie
    Create todo    ${todoName}

User checks if todo was created
    Todo is on the list    ${todoName}

User completes the todo
    Complete todo

User checks if todo is completed
    Check if todo marked as completed

User checks if todo is NOT on Active tab
    Go to Active Tab
    Todo is NOT on the list    ${todoName}

User checks if todo is on Completed tab
    Go to Completed Tab
    Todo is on the list    ${todoName}
