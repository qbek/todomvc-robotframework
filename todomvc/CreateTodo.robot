*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${TODOMVC_APP} =    http://todomvc.com/examples/angularjs/#/
${BROWSER} =     firefox

${NEW_TODO_INPUT} =    css:.new-todo
${TODO_ITEM} =    css:.todo-list li

${TODO_NAME} =     Learn RobotFramework

*** Test Cases ***
User can creates a todo
    User opens TodoMVC app
    User creates a new todo
    User checks if todo is created


*** Keywords ***
User opens TodoMVC app
    Open Browser    ${TODOMVC_APP}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${NEW_TODO_INPUT}

User creates a new todo
    Input Text    ${NEW_TODO_INPUT}    ${TODO_NAME}
    Press Keys    ${NEW_TODO_INPUT}    RETURN

User checks if todo is created
    Element Text Should Be    ${TODO_ITEM}    ${TODO_NAME}
    Sleep    2s
