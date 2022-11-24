*** Settings ***
Resource          steps/UserActions.robot
Test Teardown     Close Browser

*** Test Cases ***
Use can complete a todo
    User has TodoMVC app opened
    User creates a new todo
    User completes the todo
    User checks if todo is completed
    User checks if todo is NOT on Active tab
    User checks if todo is on Completed tab
