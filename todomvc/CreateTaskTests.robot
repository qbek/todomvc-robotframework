*** Settings ***
Resource    steps/UserSteps.robot
Test Teardown     User closes TodoMVC app

*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates new todo
    User chcekcs if todo is created
  
User can create a few todos
    User opens TodoMVC app
    User creates few todos
    User checks if all todos are created




