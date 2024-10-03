*** Settings ***
Resource    steps/User_steps.robot
Test Teardown    User colses TodoMVC app

*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User creates a new todo
    User verifies todo is created
