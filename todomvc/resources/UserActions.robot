*** Settings ***
Resource     pageobjects/todo_input.robot
Resource     pageobjects/todo_filters.robot
Resource     pageobjects/todos_list.robot
Resource     pageobjects/todomvc_app.robot

Resource     pageobjects/todo_counter.robot

*** Keywords ***
User opens TodoMVC app
    Start todomvc app

User closes TodoMVC app
    Stop todomvc app

User enters a todo
    Set test variable with todo name
    Create new todo    ${todoName}

User creates few todos
    Set test variable with few todos names
    FOR     ${todo}   IN   @{todosNames}
        Create new todo    ${todo}
    END

User checks if counter shows correct todos count
    ${expected} =     Get count of existing todos
    Check if counter shows     ${expected}

User checks if todo was created
    Check if todo is visible     ${todoName}

User checks if all todos were created
    FOR     ${todo}   IN   @{todosNames}
        Check if todo is on the list    ${todo}
    END

User completes the todo
    Complete todo

User checks if todo is marked as completed
    Check if todo is marked as completed

User checks if todo is not on Active tab
    Switch to Active filter
    Check if todo is NOT visible     ${todoName}

User checks if todo is on Completed tab
    Switch to Completed filter
    Check if todo is visible     ${todoName}