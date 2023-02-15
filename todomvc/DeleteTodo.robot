*** Settings ***
Resource    steps/UserActions.robot
Resource    steps/UserVerifications.robot
Resource    steps/UserPreconditions.robot
Test Setup    User opens TodoMVC app
Test Teardown    User closes TodoMVC app


*** Test Cases ***
User can delete todo
    User has a todo
    User deletes the todo
    User checks if todo was deleted


