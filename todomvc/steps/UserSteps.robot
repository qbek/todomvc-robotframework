*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${todoName} =     Nowe lepsze zadanie
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${NEW_TODO} =     css:.new-todo
${TODOS_LIST} =    css:.todo-list
${TODO} =         css:.todo-list li
${TODO_COMPLETE_TOGGLE} =    css:.toggle
${ACTIVE_FILTER} =    css:[href="#/active"]
${COMPLETED_FILTER} =    css:[href="#/completed"]

*** Keywords ***
User opens TodoMVC app
    Open Browser    ${TODOMVC_URL}    firefox
    Wait Until Element Is Visible    ${NEW_TODO}

User creats new todo
    Input Text    ${NEW_TODO}    ${todoName}
    Press Keys    ${NEW_TODO}    RETURN

User checks if new todo is listed
    Element Text Should Be    ${TODOS_LIST}    ${todoName}

User completes a todo
    Select Checkbox    ${TODO_COMPLETE_TOGGLE}

User checks if todo is marked as completed
    Element Attribute Value Should Be    ${TODO}    class    completed

User checks if completed todo is NOT on Active tab
    Click Element    ${ACTIVE_FILTER}
    Element Should Not Contain    ${TODOS_LIST}    ${todoName}

User checks if completed todo is on Completed tab
    Click Element    ${COMPLETED_FILTER}
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
