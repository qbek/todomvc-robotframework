*** Settings ***
Resource          ../pageobjects/todos_list.robot
Resource          ../pageobjects/todo_filters.robot


*** Keywords ***
User checks if new todo is listed
    Check if todo is listed    ${todoName}

User checks if todo is marked as completed
    Check if todo completed

User checks if completed todo is NOT on Active tab
    Go to Active filter
    Check if todo is NOT listed    ${todoName}

User checks if completed todo is on Completed tab
    Go to Completed filter
    Check if todo is listed    ${todoName}

User checks if all todos are listed
    Check if all todos are listed    @{todosNames}
