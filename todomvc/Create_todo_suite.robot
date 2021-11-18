*** Settings ***
Library    SeleniumLibrary
Test Teardown   Close browser
Resource    resources/User_actions.robot
Resource    data/env_${ENV}.robot
Resource    data/td_${TD}.robot


*** Test Cases ***
User can create a new todo
    User opens TodoMVC app
    User adds a new todo
    User checks if todo was created


