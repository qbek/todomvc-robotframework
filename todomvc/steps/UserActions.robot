*** Settings ***
Resource          ../testdata/TD_${TD}.robot
Resource          ../pageobjects/TodoInput.robot
Resource          ../pageobjects/TodoFilters.robot
Resource          ../pageobjects/TodosList.robot

*** Keywords ***
User creates a new todo
    Setup todoName test variable
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

User creates a few todos
    Setup todoNames test variable
    FOR    ${name}    IN    @{todoNames}
        Create todo    ${name}
    END

User checks if all todos were created
    All todos are on the list    @{todoNames}

User deletes todo
    Delete todo

User checks if todo was deleted
    Todo is NOT on the list    ${todoName}

User creates THE ONE
    Create todo    THE ONE

User deletes THE ONE
    Delete todo    THE ONE
