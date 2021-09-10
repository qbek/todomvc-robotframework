*** Settings ***
Resource    resources/UserActions.robot
Resource    data/${TD}_td.robot
Resource    data/${ENV}_env.robot

Test Setup    User opens TodoMVC app
Test Teardown    User closes TodoMVC app


*** Test Cases ***
User can create a new todo
    [Tags]   th1
    User enters a todo
    User checks if todo was created


User can check todos counter value
    [Tags]   th2
    User creates few todos
    User checks if counter shows correct todos count

User can create few todos
    User creates few todos
    User checks if all todos were created


