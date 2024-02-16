*** Settings ***
Resource   steps/UserSteps.robot
Resource   steps/UserPreconditions.robot
Test Setup    User opens TodoMVC app
Test Teardown     User closes TodoMVC app


*** Test Cases ***
User can complete a todo
    Given User has a todo
    When User completes a todo
    Then User checks if todo is marked as completed

User can filter out completed todos using Active filter
    Given User has completed todo
    When User switch to Active filter
    Then User checks if todo is not displayed

User can filter all completed todos
    User creates new todo
    User completes a todo
    User checks if completed todo is on Completed tab




