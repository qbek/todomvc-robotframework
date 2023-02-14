*** Settings ***
Library     SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${BROWSER} =     firefox

${NEW_TODO_INPUT} =    css:.new-todo
${TODOS_LIST} =    css:.todo-list
${TODO_ITEM} =    ${TODOS_LIST} li

${TODO_COMPLETE_TOGGLE} =     css:.toggle
${ACTIVE_TAB} =     css:[href="#/active"]
${COMPLETED_TAB} =   css:[href="#/completed"]

${todoName} =    Moje pierwsze zadanie 2


*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates a new todo
    User checks if todo was created

User can mark todo as completed
    User opens TodoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if todo is marked as completed
    User checks if completed todo is NOT on Active list
    User checks if completed todo is on Completed list



*** Keywords ***
User opens TodoMVC app
    Open Browser    ${TODOMVC_URL}      ${BROWSER}
    Wait Until Element Is Visible     ${NEW_TODO_INPUT}

User creates a new todo
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press keys    ${NEW_TODO_INPUT}    RETURN

User checks if todo was created
    Element Text Should Be    ${TODOS_LIST}    ${todoName}

User marks todo as completed
    Select Checkbox     ${TODO_COMPLETE_TOGGLE}

User checks if todo is marked as completed
    Element Attribute Value Should Be     ${TODO_ITEM}     class     completed

User checks if completed todo is NOT on Active list
    Click element    ${ACTIVE_TAB}
    Element Text Should Not Be     ${TODOS_LIST}     ${todoName}


User checks if completed todo is on Completed list
    Click element     ${COMPLETED_TAB}
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
