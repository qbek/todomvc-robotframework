*** Settings ***
Test Teardown     Close browser
Resource     resources/User_actions.robot
Resource    testdata/${ENV}_env.robot
Resource    testdata/testdata.robot

*** Test Cases ***
User can add a todo
    [Tags]    Smoke
    User opens todoMVC application
    User adds a new todo
    Todo is on the todos list

User can add a multiple todos
    User opens todoMVC application
    User adds a few todos
    Todos counter shows correct number of created todos
