*** Settings ***
Resource    resources/user_actions.robot
Test Teardown    Close browser

*** Test Cases ***
User can see that todo is completed
    Given user opens todoMVC app
    And user creates a new todo
    When user completes a todo
    Then user sees todo marked as completed

User sees completed todo on Completed list
    Given user opens todoMVC app
    And user creates a new todo
    When user completes a todo
    Then completed todo is on Completed list

User doesn't see completed todo on Active list
    Given user opens todoMVC app
    And user creates a new todo
    When user completes a todo
    Then completed todo is not on the Active list


