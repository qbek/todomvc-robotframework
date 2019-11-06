*** Settings ***
Resource   TestData/${ENV}.robot
Resource   Resources/User_actions.robot
Test Teardown    Close Browser

*** Test Cases ***
User can complete a todo
    [Tags]    smoke
    User opens ToDo application
    User adds a new todo
    User completes created todo
    Todo is marked as completed

Completed todo is not on Active section
    User opens ToDo application
    User adds a new todo
    User completes created todo
    Todo is not listed on 'Active' section

Completed todo is on Completed section
    User opens ToDo application
    User adds a new todo
    User completes created todo
    Todo is listed on 'Completed' section
