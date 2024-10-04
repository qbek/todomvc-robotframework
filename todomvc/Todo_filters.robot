*** Settings ***
Resource    steps/User_steps.robot
Test Teardown    User colses TodoMVC app


*** Test Cases ***
User can filter active todos
    User opens TodoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if completed todo is NOT on Active list


User can filter completed todos
    User opens TodoMVC app
    User creates a new todo
    User marks todo as completed
    User checks if completed todo is on Completed list

