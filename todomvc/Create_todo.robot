*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/dist/#/all
${BROWSER} =    firefox

${NEW_TODO_INPUT} =    css:#new-todo
${TODO_ITEM_LABEL} =   css:#todo-list label

${todoName} =   To jest moje pierwsze zadanie

*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates a new todo
    User verifies todo is created

User can complete the todo
    User opens TodoMVC app
    User creates a new todo
    

*** Keywords ***
User opens TodoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}
    Wait Until Element Is Visible    ${NEW_TODO_INPUT}

User creates a new todo
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press Keys    ${NEW_TODO_INPUT}    RETURN

User verifies todo is created
    Element Text Should Be     ${TODO_ITEM_LABEL}    ${todoName}


