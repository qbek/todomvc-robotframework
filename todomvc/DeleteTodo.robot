*** Settings ***
Resource   steps/UserActions.robot
Resource   steps/UserVerifications.robot
Test Teardown    Close Browser


*** Test Cases ***
User can delete todo
    User opens TodoMVC app
    User creates a new todo
    User deletes todo
    User checks if todo is deleted

