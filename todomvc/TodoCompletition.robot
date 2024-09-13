*** Settings ***
Resource    steps/UserSteps.robot
Test Setup    User opens todoMVC app
Test Teardown    Close Browser

*** Test Cases ***
User can complete a new todo
    Given User creates a new todo
    When User marks todo as completed
    Then User checks if todo is marked as completed
  
User can filter out completed todo on Active tab
    User creates a new todo
    User marks todo as completed
    User checks if completed todo is NOT on Active list

User can filter all complteted todo on Complteted tab
    User creates a new todo
    User marks todo as completed
    User checks if completed todo is on Completed list
