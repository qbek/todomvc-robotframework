*** Settings ***
Resource   steps/UserActions.robot
Resource   steps/UserVerifications.robot
# Test Setup    User opens TodoMVC app
Test Teardown    Close Browser

*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates a new todo
    User checks if todo was created

User can create few todos
    User opens TodoMVC app
    User creates a few todos
    User checks if all todos are created