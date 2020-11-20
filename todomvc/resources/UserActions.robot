*** Settings ***
Resource   ../testdata/testdata_${ENV}_env.robot
Resource   pageobjects/TodoInput.robot
Resource   pageobjects/TodoFilters.robot
Resource   pageobjects/TodosList.robot
Resource   pageobjects/TodoCounter.robot
Resource   pageobjects/App.robot

*** Keywords ***
User opens TodoMVC application
    Open todoMVC application
    Todo input is dispalyed

User creates a new todo
    Set a TODO_NAME test variable
    Create a todo    ${TODO_NAME}

User creates a few todo
    Set a FEW_TODO_NAMES test variable
    FOR   ${todo}    IN     @{FEW_TODO_NAMES}
        Create a todo    ${todo}
    END

User creates THE ONE!
    create a todo    THE ONE!

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

User checks if todo counter shows correct value
    ${count_of_todos} =     Get count of existing todos
    Check if counter is     ${count_of_todos}

User deletes a todo
    Delete a todo

User checks if todo is NOT on All tab
    Todo is NOT on the list    ${TODO_NAME}

User deletes THE ONE!
    Delete a todo    THE ONE!

User checks if THE ONE! is not on the list
    Todo is NOT on the list     THE ONE!
