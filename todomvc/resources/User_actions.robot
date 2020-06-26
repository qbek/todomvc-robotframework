*** Settings ***
Library    FakerLibrary
Resource   pageobjects/New_todo_input.robot
Resource   pageobjects/Todo_filters.robot
Resource   pageobjects/Todos_list.robot
Resource   pageobjects/Application.robot
Resource   pageobjects/Todos_counter.robot

*** Keywords ***
User opens todoMVC application
    Open todoMVC application

User adds a new todo
    Add a todo    ${TODO_NAME}

User adds a few todos
    ${number} =    Random Int    min=2    max=6
    @{todos} =    Sentences    nb=${number}
    FOR    ${todo}    IN    @{todos}
        Add a todo    ${todo}
    END

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

Todos counter shows correct number of created todos
    ${todos_count} =    Calculate todos count
    Check if counter shows value    ${todos_count}

User deletes added todo
    Delete todo with name     ${TODO_NAME}

User deletes The One!
    Delete todo with name    ${THE_ONE}

Deleted todo is not on the list
    Todo is not on the list    ${TODO_NAME}


User adds The One!
    Add a todo    ${THE_ONE}
