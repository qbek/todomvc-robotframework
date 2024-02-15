*** Settings ***
Resource   steps/UserSteps.robot
Test Teardown     User closes TodoMVC app


*** Test Cases ***
User can complete a todo
    User opens TodoMVC app
    User creates new todo
    User completes a todo
    User checks if todo is marked as completed

User can filter out completed todos using Active filter
    User opens TodoMVC app
    User creates new todo
    User completes a todo
    User checks if completed todo is NOT on Active tab

User can filter all completed todos
    User opens TodoMVC app
    User creates new todo
    User completes a todo
    User checks if completed todo is on Completed tab




