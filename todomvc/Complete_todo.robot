*** Settings ***
Resource    steps/User_steps.robot
Test Teardown    User colses TodoMVC app


*** Test Cases ***
User can complete the todo
    User opens TodoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if todo is marked as completed

