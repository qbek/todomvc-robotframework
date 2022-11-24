*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${NEW_TODO} =     css:.new-todo
${TODOS_LIST} =    css:.todo-list
${TODO} =         css:.todo-list li
${COMPLETE_TODO} =    css:.toggle
${ACTIVE_TAB} =    css:[href="#/active"]
${COMPLETED_TAB} =    css:[href="#/completed"]

*** Keywords ***
User has TodoMVC app opened
    Open Browser    ${TODOMVC_URL}    firefox
    Wait Until Element Is Visible    ${NEW_TODO}

User creates a new todo
    Set Test Variable    ${todoName}    Moje pierwsze zadanie
    Input Text    ${NEW_TODO}    ${todoName}
    Press Keys    ${NEW_TODO}    RETURN

User checks if todo was created
    Element Text Should Be    ${TODOS_LIST}    ${todoName}

User completes the todo
    Select Checkbox    ${COMPLETE_TODO}

User checks if todo is completed
    Element Attribute Value Should Be    ${TODO}    class    completed

User checks if todo is NOT on Active tab
    Click element    ${ACTIVE_TAB}
    Element Text Should Not Be    ${TODOS_LIST}    ${todoName}

User checks if todo is on Completed tab
    Click Element    ${COMPLETED_TAB}
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
