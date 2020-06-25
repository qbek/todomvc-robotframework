*** Settings ***
Resource    resources/User_actions.robot
Resource    testdata/${ENV}_env.robot
Test Teardown     Close browser


*** Test Cases ***
User can mark a todo as completed
    User opens todoMVC application
    User adds a new todo
    User completes the todo
    The todo is marked as completed

Completed todo is not on Active todos list
    User opens todoMVC application
    User adds a new todo
    User completes the todo
    The todo is not on the Active list

Completed todo is on Completed todos list
    User opens todoMVC application
    User adds a new todo
    User completes the todo
    The todo is on the Completed list

