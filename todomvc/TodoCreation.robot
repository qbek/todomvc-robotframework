*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${todoName} =     Nowe lepsze zadanie
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${NEW_TODO} =     css:.new-todo
${TODOS_LIST} =    css:.todo-list

*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creats new todo
    User checks if new todo is listed

*** Keywords ***
User opens TodoMVC app
    Open Browser    ${TODOMVC_URL}    firefox
    Wait Until Element Is Visible    ${NEW_TODO}

User creats new todo
    Input Text    ${NEW_TODO}    ${todoName}
    Press Keys    ${NEW_TODO}    RETURN

User checks if new todo is listed
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
