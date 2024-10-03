*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/dist/#/all
${BROWSER} =    firefox

${NEW_TODO_INPUT} =    css:#new-todo

${TODOS_LIST} =    css:#todo-list
${TODO_ITEM} =    ${TODOS_LIST} li 
${TODO_COMPLETE_TOGGLE} =     ${TODO_ITEM} .toggle

${FILTERS} =   css:#filters
${ACTIVE_TAB} =     ${FILTERS} [href="#/active"]
${COMPLETED_TAB} =   ${FILTERS} [href="#/completed"]

${todoName} =   To jest moje pierwsze zadanie


*** Keywords ***
User opens TodoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}
    Wait Until Element Is Visible    ${NEW_TODO_INPUT}

User creates a new todo
    Input Text    ${NEW_TODO_INPUT}    ${todoName}
    Press Keys    ${NEW_TODO_INPUT}    RETURN

User verifies todo is created
    Element Text Should Be     ${TODOS_LIST}    ${todoName}

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

User colses TodoMVC app
    Close browser
    