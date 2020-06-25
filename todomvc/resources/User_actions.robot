*** Settings ***
Resource   pageobjects/New_todo_input.robot
Resource   pageobjects/Todo_filters.robot
Resource   pageobjects/Todos_list.robot
Resource   pageobjects/Application.robot

*** Keywords ***
User opens todoMVC application
    Open todoMVC application

User adds a new todo
    Add a todo    ${TODO_NAME}

Todo is on the todos list
    Todo is on the list    ${TODO_NAME}

User completes the todo
    Complete a todo

The todo is marked as completed
    Todo is displayed as completed

The todo is not on the Active list
    Switch to active todos filter
    Todo is not on the list    ${TODO_NAME}

The todo is on the Completed list
    Switch to completed todos filter
    Todo is on the list    ${TODO_NAME}