*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${NEW_TODO} =     css:.new-todo
${TODOS_LIST} =    css:.todo-list

*** Test Cases ***
User can create a task
    User has TodoMVC app opened
    User creates a new todo
    User checks if todo was created

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
