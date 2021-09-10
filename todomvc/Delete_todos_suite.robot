*** Settings ***
Resource    resources/UserActions.robot
Resource    data/${TD}_td.robot
Resource    data/${ENV}_env.robot

Test Setup    User opens TodoMVC app
Test Teardown    User closes TodoMVC app


*** Test Cases ***
User can delete a todo
    User enters a todo
    User deletes a todo
    User checks if todo was deleted


User can delete THE TODO
    User creates few todos
    User creates the one
    User creates few todos
    User deletes the one