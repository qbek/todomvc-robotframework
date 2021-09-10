*** Settings ***
Resource    resources/UserActions.robot
Resource    data/${TD}_td.robot
Resource    data/${ENV}_env.robot

Test Setup    User opens TodoMVC app
Test Teardown    User closes TodoMVC app


*** Test Cases ***
User can complete a todo
    User enters a todo
    User completes the todo
    User checks if todo is marked as completed

Completed todo is not listed on Active tab
    User enters a todo
    User completes the todo
    User checks if todo is not on Active tab

Completed todo is listed on Completed tab
    User enters a todo
    User completes the todo
    User checks if todo is on Completed tab


