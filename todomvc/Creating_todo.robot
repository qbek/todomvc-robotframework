*** Settings ***
Test Teardown    Close browser
Resource    resources/user_actions.robot
Library    Dialogs


*** Test Cases ***
User can create a todo
    [Documentation]   User can simply create a todo
    [Tags]   smoke
    Given user opens todoMVC app
    When user creates a new todo
    Then user can see his todo on the list

User can create multiple todos
    [Documentation]    User can simply add few todos
    [Tags]   extended
    Given user opens todoMVC app
    When user creates few todos
    Then todo counter show correct number