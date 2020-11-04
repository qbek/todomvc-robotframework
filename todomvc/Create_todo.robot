*** Settings ***
Library   Dialogs
Resource    resources/User_actions.robot
Resource    data/ENV_${ENV}.robot
Resource    data/TD_${TD}.robot
Test Teardown    Close browser

*** Test Cases ***
User can create a todo
    [Tags]    th_2
    User opens TodoMVC applications
    User creates a todo
    User checks if todo is on the list
#    Execute manual step    sprawdz prosze czy todo sie stworzylo

User can create few todos
    [Tags]    th_1
    User opens TodoMVC applications
    User creates a few todo
    User verify todo counter

