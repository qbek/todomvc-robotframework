*** Settings ***
Resource          steps/UserActions.robot
Resource          steps/UserPreconditions.robot
Test Teardown     User closes TodoMVC app

*** Test Cases ***
User can create a todo
    User has TodoMVC app opened
    User creates a new todo
    User checks if todo was created

User can create few todos
    User has TodoMVC app opened
    User creates a few todos
    User checks if all todos were created