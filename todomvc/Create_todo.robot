*** Settings ***
Library    Dialogs
Resource   TestData/${ENV}.robot
Resource   Resources/User_actions.robot
Test Teardown    Close Browser

*** Test Cases ***
User can add a new todo
    [Tags]  smoke
    User opens ToDo application
    User adds a new todo
    A new todo is created

User can add few todos
    User opens ToDo application
    User adds few todos
    Todo counter shows correct number of todos

