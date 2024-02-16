*** Settings ***
Resource    steps/UserSteps.robot
Test Teardown     User closes TodoMVC app

*** Test Cases ***
User can delete a todo
    User opens TodoMVC app
    User creates new todo
    User deletes todo
    User checks if todo is deleted