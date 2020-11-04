*** Settings ***
Resource    pageobjects/todo_input_object.robot
Resource    pageobjects/todos_list_object.robot
Resource    pageobjects/todos_filtering_tabs_object.robot
Resource    pageobjects/application_object.robot

*** Keywords ***
User opens TodoMVC applications
    Open application
    Wait for input todo element is ready

User creates a todo
    Setup test variable TODO_NAME
    User create a todo with name    ${TODO_NAME}

User create a todo with name
    [Arguments]    ${name}
    Enter a todo name    ${name}
    Create a todo by pressing ENTER

User checks if todo is on the list
    Todo is on the list   ${TODO_NAME}

User checks if todo is NOT on the list
    Todo is NOT on the list    ${TODO_NAME}

User completes created todo
    Mark todo as completed

User checks if todo is marked as completed
    Todo is marked as completed

User checks if todo is NOT on Active tab
    Switch to Active tab
    Todo is NOT on the list     ${TODO_NAME}

User checks if todo is on Completed tab
    Switch to Completed tab
    Todo is on the list    ${TODO_NAME}

User creates a few todo
    Setup test variable TODOS_NAME
    FOR   ${todo}    IN    @{TODOS_NAME}
       User create a todo with name    ${todo}
    END

User verify todo counter
    ${todos_count} =    Get Length     ${TODOS_NAME}
    Todo counter shows     ${todos_count}

User deletes a todo
    Delete todo with name    ${TODO_NAME}

User delete THE TASK
    Delete todo with name    ${THE_TASK}

User checks if THE TASK in NOT on the list
    Todo is NOT on the list    ${THE_TASK}