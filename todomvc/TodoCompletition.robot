*** Settings ***
Resource    steps/UserSteps.robot
Resource    steps/UserPreconditions.robot

Test Setup    User opens todoMVC app
Test Teardown    Close Browser

*** Test Cases ***
User can complete a new todo
    User has a todo created
    User marks todo as completed
    User checks if todo is marked as completed
  
User can filter out completed todo on Active tab
    User has completed todo
    User switches to Active todos filter
    User checks if completed todo is not displayed


User can filter all complteted todo on Complteted tab
    User has completed todo
    User switches to Completed todos filter
    User checks if completed todo is displayed
