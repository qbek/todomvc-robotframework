*** Settings ***
Library     SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${BROWSER} =     firefox

${NEW_TODO_INPUT} =    css:.new-todo
${TODOS_LIST} =    css:.todo-list

${todoName} =    Moje pierwsze zadanie 2


*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates a new todo
    User checks if todo was created

    

*** Keywords ***
User opens TodoMVC app
    Open Browser    ${TODOMVC_URL}      ${BROWSER}
    Wait Until Element Is Visible     ${NEW_TODO_INPUT}

User creates a new todo
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press keys    ${NEW_TODO_INPUT}    RETURN

User checks if todo was created
    Element Text Should Be    ${TODOS_LIST}    ${todoName}