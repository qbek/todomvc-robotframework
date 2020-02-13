*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close browser


*** Variables ***
${BROWSER} =    firefox
${NEW_TODO_INPUT} =    css:.new-todo
${TODOS_LIST} =    css:.todo-list
${TODO} =    ${TODOS_LIST} li
${COMPLETE_TODO} =   ${TODO} .toggle

${ACTIVE_TODOS} =    css:[href="#/active"]
${COMPLETED_TODOS} =    css:[href="#/completed"]

*** Test Cases ***
User can create a todo
    Given user opens todoMVC app
    When user creates a new todo
    Then user can see his todo on the list


User can complete a todo
    Given user opens todoMVC app
    And user creates a new todo
    When user completes a todo
    Then user sees todo marked as completed
    And completed todo is not on the Active list
    And completed todo is on Completed list


*** Keywords ***
user opens todoMVC app
    Open browser    http://todomvc.com/examples/angularjs/#/    ${BROWSER}
    Maximize browser window
    Wait until page contains element    ${NEW_TODO_INPUT}

user creates a new todo
    Input text    ${NEW_TODO_INPUT}    Learn RobotFramework
    Press keys    ${NEW_TODO_INPUT}    RETURN

user can see his todo on the list
    Element should contain     ${TODOS_LIST}    Learn RobotFramework

user completes a todo
    Click element    ${COMPLETE_TODO}

user sees todo marked as completed
    ${classes} =   Get Element Attribute    ${TODO}    class
    Should Contain   ${classes}    completed

completed todo is not on the Active list
    Click element    ${ACTIVE_TODOS}
    Element should not contain     ${TODOS_LIST}    Learn RobotFramework

completed todo is on Completed list
    Click element    ${COMPLETED_TODOS}
    user can see his todo on the list