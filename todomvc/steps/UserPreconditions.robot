*** Settings ***
Resource          UserActions.robot
Resource          ../pageobjects/TodoInput.robot

*** Keywords ***
User has TodoMVC app opened
    Open Browser    ${TODOMVC_URL}    firefox
    Wait for TodoMVC app to be ready

User has created todo
    User creates a new todo
    User checks if todo was created
