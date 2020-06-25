*** Settings ***
Test Teardown     Close browser
Resource     resources/User_actions.robot

*** Test Cases ***
User can add a todo
    User opens todoMVC application
    User adds a new todo
    Todo is on the todos list




