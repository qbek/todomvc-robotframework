*** Settings ***
Resource   pageobjects/todo_input.robot
Resource   pageobjects/todos_list.robot
Resource   pageobjects/todo_filters.robot
Resource   pageobjects/todo_counter.robot

*** Keywords ***
User opens TodoMVC app
    Open browser      ${TODOMVC_URL}   ${BROWSER}
    Wait until page contains element     ${TODO_INPUT}

User adds a new todo
    Set test variable TODO_NAME
    Create new todo     ${TODO_NAME}

User adds a few todos
    Set test variable TODO_NAMES
    FOR    ${todo}   IN   @{TODO_NAMES}
        Create new todo    ${todo}
    END

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

User checks if counter shows correct value
    # pierwsze podejscie z wyliczeniem dlugosci tablicy
#    ${count} =     Get length     ${TODO_NAMES}
    ${count} =   Get count of todos on the list
    Check if counter shows    ${count}
