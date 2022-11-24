*** Settings ***
Resource          UserActions.robot
Resource          ../pageobjects/TodoInput.robot
Resource          ../pageobjects/TodoMVCapp.robot

*** Keywords ***
User has TodoMVC app opened
    Open TodoMVC app
    Wait for TodoMVC app to be ready

User has created todo
    User creates a new todo
    User checks if todo was created

User closes TodoMVC app
    Close TodoMVC app
