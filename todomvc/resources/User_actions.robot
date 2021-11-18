*** Settings ***
Resource   pageobjects/todo_input.robot
Resource   pageobjects/todos_list.robot
Resource   pageobjects/todo_filters.robot

*** Keywords ***
User opens TodoMVC app
    Open browser      ${TODOMVC_URL}   ${BROWSER}
    Wait until page contains element     ${TODO_INPUT}

User adds a new todo
    Create new todo     ${TODO_NAME}

User checks if todo was created
    Check if todo is on the list    ${TODO_NAME}

User completes the todo
    Complete todo

User checks if todo is marked as completed
    Check if todo is completed

User checks if completed todo is not on Active tab
    Switch to Active tab
    Check if todo is NOT on the list    ${TODO_NAME}

User checks if completed todo is on Completed tab
    Switch to Completed tab
    Check if todo is on the list     ${TODO_NAME}
