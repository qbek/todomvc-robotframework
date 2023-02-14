*** Settings ***
Resource    steps/UserActions.robot
Resource    steps/UserVerifications.robot
Test Teardown    User closes TodoMVC app


*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates a new todo 
    User checks if todo was created

User can create a few todos
    User opens TodoMVC app
    User creates a few todos
    User checks if all todos were created


