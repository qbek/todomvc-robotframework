*** Settings ***
Resource   TestData/${ENV}.robot
Resource   Resources/User_actions.robot
Test Teardown    Close Browser

*** Test Cases ***
User can delete a todo
    [Tags]    smoke
    User opens ToDo application
    User adds a new todo
    User deletes created todo
    Todo is not listed


User can delete any todo
    User opens ToDo application
    User adds few todos
    User adds "DELETE ME!" todo
    User adds few todos
    User deletes "DELETE ME!"
    Todo "DELETE ME!" is not listed