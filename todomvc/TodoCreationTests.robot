*** Settings ***
Resource          steps/UserActions.robot
Resource          steps/UserPreconditions.robot
Test Teardown     Close Browser

*** Test Cases ***
User can create a task
    User has TodoMVC app opened
    User creates a new todo
    User checks if todo was created
