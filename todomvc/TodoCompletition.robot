*** Settings ***
Resource    steps/UserSteps.robot
Test Teardown    Close Browser

*** Test Cases ***
User can complete a new todo
    User opens todoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if todo is marked as completed
    User checks if completed todo is NOT on Active list
    User checks if completed todo is on Completed list



