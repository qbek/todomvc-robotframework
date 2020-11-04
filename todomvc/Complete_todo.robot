*** Settings ***
Resource    resources/User_actions.robot
Resource    data/ENV_${ENV}.robot
Resource    data/TD_${TD}.robot
Test Teardown    Close browser

*** Test Cases ***
User can complete a todo
    User opens TodoMVC applications
    User creates a todo
    User completes created todo
    User checks if todo is marked as completed

Completed todo is NOT on Active tab
    User opens TodoMVC applications
    User creates a todo
    User completes created todo
    User checks if todo is NOT on Active tab

Completed todo is on Comeplete tab
    User opens TodoMVC applications
    User creates a todo
    User completes created todo
    User checks if todo is on Completed tab

