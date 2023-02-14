*** Settings ***
Resource    steps/UserActions.robot
Resource    steps/UserVerifications.robot
Test Teardown    User closes TodoMVC app


*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates a new todo 
    User checks if todo was created




