*** Settings ***
Resource    steps/UserSteps.robot
Test Teardown     User closes TodoMVC app

*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates new todo
    User chcekcs if todo is created
  