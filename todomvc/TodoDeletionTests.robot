*** Settings ***
Resource          steps/UserActions.robot
Resource          steps/UserPreconditions.robot
Test Setup        User has TodoMVC app opened
Test Teardown     User closes TodoMVC app

*** Test Cases ***
User can create a todo
    User has created todo
    User deletes todo
    User checks if todo was deleted
