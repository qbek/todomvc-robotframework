*** Settings ***
Resource    steps/UserSteps.robot
Test Teardown     User closes TodoMVC app

*** Test Cases ***
User can delete a todo
    User opens TodoMVC app
    User creates new todo
    User deletes todo
    User checks if todo is deleted

User can delete THE ONE
    User opens TodoMVC app
    User creates few todos
    User creates THE ONE
    User creates few todos
    User deletes THE ONE