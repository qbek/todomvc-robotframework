*** Settings ***
Test Teardown     Close Browser
Resource          steps/UserSteps.robot

*** Test Cases ***
User can complete a todo
    User opens TodoMVC app
    User creats new todo
    User completes a todo
    User checks if todo is marked as completed
    User checks if completed todo is NOT on Active tab
    User checks if completed todo is on Completed tab
