*** Settings ***
Test Teardown   Close browser
Resource    resources/User_actions.robot
Resource    data/env_${ENV}.robot
Resource    data/td_${TD}.robot


*** Test Cases ***
User can create a new todo
    [Tags]    smoke
    User opens TodoMVC app
    User adds a new todo
    User checks if todo was created

User can create a few todos
    User opens TodoMVC app
    User adds a few todos
    User checks if counter shows correct value
