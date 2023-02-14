*** Settings ***
Resource    steps/UserActions.robot
Resource    steps/UserVerifications.robot
Test Teardown    User closes TodoMVC app


*** Test Cases ***
User can mark todo as completed
    User opens TodoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if todo is marked as completed
    
User can filter out completed todos on Active tab
    User opens TodoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if completed todo is NOT on Active list

User can filter completed todos on Completed tab
    User opens TodoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if completed todo is on Completed list

