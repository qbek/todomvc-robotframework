*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER} =   firefox
${TODOMVC_URL} =     http://todomvc.com/examples/angularjs/#/

${TODO_INPUT} =     css:.new-todo
${TODOS_LIST} =     css:.todo-list

${TODO_ITEM} =    css:.todo-list li
${TODO_COMPLETE} =    css:.todo-list li .toggle

${ACTIVE_FILTER_TAB} =    css:[href="#/active"]
${COMPLETED_FILTER_TAB} =    css:[href="#/completed"]

${TODO_NAME} =     Learn RobotFramework

*** Keywords ***
User opens TodoMVC application
    Open browser      ${TODOMVC_URL}    ${BROWSER}
    Wait until page contains element     ${TODO_INPUT}

User creates a new todo
    Input text     ${TODO_INPUT}     ${TODO_NAME}
    Press keys     ${TODO_INPUT}     RETURN

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