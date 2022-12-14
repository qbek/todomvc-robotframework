*** Settings ***
Test Teardown     Close Browser
Resource          steps/UserSteps.robot

*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creats new todo
    User checks if new todo is listed
