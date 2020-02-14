*** Settings ***
Resource    resources/user_actions.robot
Test Teardown    Close browser

*** Test Cases ***
User can delete a todo
    Given user opens todoMVC app
    And user creates a new todo
    When user deletes a todo
    Then deleted todo is not on the list

User deletes the One
    Given user opens todoMVC app
    And user creates few todos
    And user creates The One
    And user creates few todos
    When user deleted The One
    Then The One is not on the list
