*** Settings ***
Library    SeleniumLibrary
Resource   ../testdata/testdata_${ENV}_env.robot
Resource   pageobjects/TodoInput.robot
Resource   pageobjects/TodoFilters.robot
Resource   pageobjects/TodosList.robot




*** Keywords ***
User opens TodoMVC application
    Open browser      ${TODOMVC_URL}    ${BROWSER}
    Wait until page contains element     ${TODO_INPUT}

User creates a new todo
    Create a todo    ${TODO_NAME}


User checks if created todo is on the list
    Element text should be     ${TODOS_LIST}      ${TODO_NAME}

User completes a todo
    Select checkbox     ${TODO_COMPLETE}

User checks if todo is completed
    ${classes} =   Get Element Attribute    ${TODO_ITEM}    class
    Should contain    ${classes}     completed


User checks if todo is NOT on Active tab
    Click element     ${ACTIVE_FILTER_TAB}
    Element should not contain      ${TODOS_LIST}      ${TODO_NAME}

User checks if todo is on Completed tab
    Click element     ${COMPLETED_FILTER_TAB}
    User checks if created todo is on the list