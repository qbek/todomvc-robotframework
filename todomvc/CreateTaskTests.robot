*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${todoName} =    Moje lepsze zadanie

${NEW_TODO_INPUT} =     css:#new-todo
${TODOS_LIST} =    css:#todo-list

${TODOMVC_URL} =     https://todomvc.com/examples/jquery/dist/#
${BROWSER} =    firefox


*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates new todo
    User chcekcs if todo is created


*** Keywords ***
User opens TodoMVC app
    Open Browser        ${TODOMVC_URL}    ${BROWSER}

User creates new todo
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press Keys    ${NEW_TODO_INPUT}    RETURN

User chcekcs if todo is created
    Element Text Should Be    ${TODOS_LIST}    ${todoName}

