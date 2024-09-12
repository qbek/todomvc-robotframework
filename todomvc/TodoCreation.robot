*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${BROWSER} =   firefox
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/dist/#/all
${NEW_TODO_INPUT} =     css:#new-todo
${TODOS_LIST} =    css:#todo-list

${TODO_ITEM} =    css:#todo-list li 
${TODO_COMPLETE_TOGGLE} =     css:.toggle
${ACTIVE_TAB} =     css:[href="#/active"]
${COMPLETED_TAB} =   css:[href="#/completed"]

${todoName} =  Moje pierwsze zadanie z dluza nazwa

*** Test Cases ***
User can create a new todo
    User opens todoMVC app
    User creates a new todo
    User checks if todo is crectly created


User can complete a new todo
    User opens todoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if todo is marked as completed
    User checks if completed todo is NOT on Active list
    User checks if completed todo is on Completed list


*** Keywords ***
User opens todoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}

User creates a new todo
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press Keys    ${NEW_TODO_INPUT}    RETURN

User checks if todo is crectly created
    Element Text Should Be    ${TODOS_LIST}    ${todoName}

User marks todo as completed
    Select Checkbox     ${TODO_COMPLETE_TOGGLE} 

User checks if todo is marked as completed
    Element Attribute Value Should Be     ${TODO_ITEM}    class     \ completed

User checks if completed todo is NOT on Active list
    Click element    ${ACTIVE_TAB}
    Element Text Should Not Be     ${TODOS_LIST}     ${todoName}

User checks if completed todo is on Completed list
    Click element     ${COMPLETED_TAB}
    Element Text Should Be    ${TODOS_LIST}    ${todoName}
