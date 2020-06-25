*** Settings ***
Library    SeleniumLibrary

Test Teardown     Close browser

*** Variables ***
${TODOMVC_URL} =    http://todomvc.com/examples/jquery/
${BROWSER} =    firefox

${NEW_TODO_INPUT} =    css:.new-todo
${TODO_LIST} =    css:.todo-list

${TODO} =    ${TODO_LIST} li
${COMPLETE_TODO} =   ${TODO} .toggle

${FILTERS} =   css:.filters
${ACTIVE_TODOS_FILTER} =   ${FILTERS} [href="#/active"]
${COMPLETED_TODOS_FILTER} =   ${FILTERS} [href="#/completed"]

${TODO_NAME} =     Practice RobotFramework


*** Test Cases ***
User can add a todo
    User opens todoMVC application
    User adds a new todo
    Todo is on the todos list

User can complete a todo
    User opens todoMVC application
    User adds a new todo
    User completes the todo
    The todo is marked as completed
    The todo is not on the Active list
    The todo is on the Completed list


*** Keywords ***
User opens todoMVC application
    Open browser    ${TODOMVC_URL}    ${BROWSER}

User adds a new todo
    Input text   ${NEW_TODO_INPUT}    ${TODO_NAME}
    Press keys    ${NEW_TODO_INPUT}    RETURN

Todo is on the todos list
    Element Text Should Be    ${TODO_LIST}    ${TODO_NAME}

User completes the todo
    Select checkbox    ${COMPLETE_TODO}

The todo is marked as completed
    ${classes} =   Get element attribute    ${TODO}    class
    Should contain    ${classes}    completed     Completed todo hasn't have 'completed' class added

The todo is not on the Active list
    Click element    ${ACTIVE_TODOS_FILTER}
    Element should not contain   ${TODO_LIST}   ${TODO_NAME}

The todo is on the Completed list
    Click element    ${COMPLETED_TODOS_FILTER}
    Todo is on the todos list