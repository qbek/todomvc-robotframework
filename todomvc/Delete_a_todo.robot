*** Settings ***
Test Teardown     Close browser
Resource     resources/User_actions.robot
Resource    testdata/${ENV}_env.robot

*** Test Cases ***
User can add a todo
    User opens todoMVC application
    User adds a new todo
    User deletes added todo
    Deleted todo is not on the list
