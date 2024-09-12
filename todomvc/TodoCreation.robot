*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${BROWSER} =   firefox
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/dist/#/all
${NEW_TODO_INPUT} =     css:#new-todo
${TODOS_LIST} =    css:#todo-list

${todoName} =  Moje pierwsze zadanie z dluza nazwa

*** Test Cases ***
User can create a new todo
    User opens todoMVC app
    User creates a new todo
    User checks if todo is crectly created



*** Keywords ***
User opens todoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}

User creates a new todo
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press Keys    ${NEW_TODO_INPUT}    RETURN

User checks if todo is crectly created
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
