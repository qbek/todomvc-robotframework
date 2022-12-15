*** Settings ***
Test Teardown     Close Browser
Resource          steps/ActionsSteps.robot

*** Test Cases ***
User can create a new todo
    User is on TodoMVC app
    User creates new todo
    User checks if new todo is listed
