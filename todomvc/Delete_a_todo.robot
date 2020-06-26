*** Settings ***
Test Teardown     Close browser
Resource     resources/User_actions.robot
Resource    testdata/${ENV}_env.robot
Library    Dialogs

*** Test Cases ***
User can add a todo
    User opens todoMVC application
    User adds a new todo
    User deletes added todo
    Deleted todo is not on the list

User can delete The One!
    User opens todoMVC application
    User adds a few todos
    User adds The One!
    User adds a few todos
    User deletes The One!
    Pause Execution
