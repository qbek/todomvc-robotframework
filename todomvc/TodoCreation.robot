*** Settings ***
Resource   steps/UserSteps.robot
Test Teardown    Close Browser


*** Test Cases ***
User can create a new todo
    User opens todoMVC app
    User creates a new todo
    User checks if todo is crectly created