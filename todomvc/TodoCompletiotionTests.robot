*** Settings ***
Resource          steps/UserActions.robot
Resource          steps/UserPreconditions.robot
Test Setup        User has TodoMVC app opened
Test Teardown     User closes TodoMVC app

*** Test Cases ***
User can complete a todo
    User has created todo
    User completes the todo
    User checks if todo is completed

User can filter out active todos
    User has created todo
    User completes the todo
    User checks if todo is NOT on Active tab

User can filter out complete todos
    User has created todo
    User completes the todo
    User checks if todo is on Completed tab
