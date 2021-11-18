*** Settings ***
Library    SeleniumLibrary
Test Teardown   Close browser


*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${BROWSER} =     firefox

${TODO_INPUT} =    css:.new-todo
${TODO_ELEMENT} =   css:.todo-list li

${TODO_NAME} =    Nauczyć się RobotFramework

*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User adds a new todo
    User checks if todo was created

*** Keywords ***
User opens TodoMVC app
    Open browser      ${TODOMVC_URL}   ${BROWSER}

User adds a new todo
    Input text    ${TODO_INPUT}     ${TODO_NAME}
    Press keys    ${TODO_INPUT}    RETURN

User checks if todo was created
    Element text should be     ${TODO_ELEMENT}     ${TODO_NAME}