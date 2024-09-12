*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER} =   firefox
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/dist/#/all
${NEW_TODO_INPUT} =     css:#new-todo
${TODOS_LIST} =    css:#todo-list

${todoName} =  Moje pierwsze zadanie z dluza nazwa

*** Test Cases ***
User can create a new todo
    Open Browser    ${TODOMVC_URL}    ${BROWSER}
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press Keys    ${NEW_TODO_INPUT}    RETURN
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
    Close Browser

