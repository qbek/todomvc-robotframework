*** Settings ***
Resource    resources/User_actions.robot
Resource    data/ENV_${ENV}.robot
Resource    data/TD_${TD}.robot
Test Teardown    Close browser


*** Test Cases ***
User can delete a todo
    [Tags]   th_2
    User opens TodoMVC applications
    User creates a todo
    User deletes a todo
    User checks if todo is NOT on the list

User can delete THE TASK
    [Tags]   th_1
    Set test variable    ${THE_TASK}     DELETE ME!!!
    User opens TodoMVC applications
    User creates a few todo
    User create a todo with name     ${THE_TASK}
    User creates a few todo
    User delete THE TASK
    User checks if THE TASK in NOT on the list