*** Settings ***
Resource   ../testdata/testdata_${ENV}_env.robot
Resource   pageobjects/TodoInput.robot
Resource   pageobjects/TodoFilters.robot
Resource   pageobjects/TodosList.robot
Resource   pageobjects/App.robot

*** Keywords ***
User opens TodoMVC application
    Open todoMVC application
    Todo input is dispalyed

User creates a new todo
    Create a todo    ${TODO_NAME}

User checks if created todo is on the list
    Todo is on the list    ${TODO_NAME}

User completes a todo
    Complete a todo

User checks if todo is completed
    Todo is marked as completed


User checks if todo is NOT on Active tab
    Switch to Active tab
    Todo is NOT on the list    ${TODO_NAME}

User checks if todo is on Completed tab
    Switch to Completed tab
    Todo is on the list    ${TODO_NAME}