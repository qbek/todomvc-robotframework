*** Settings ***
Test Teardown    Close browser
Resource    resources/user_actions.robot


*** Test Cases ***
User can create a todo
    Given user opens todoMVC app
    When user creates a new todo
    Then user can see his todo on the list