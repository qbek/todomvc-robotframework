*** Settings ***
Test Setup        User has TodoMVC app open
Test Teardown     Close Browser
Resource          steps/VerificationSteps.robot
Resource          steps/ActionsSteps.robot
Resource          steps/PreconditionSteps.robot

*** Test Cases ***
User can complete a todo
    User has todo
    User completes a todo
    User checks if todo is marked as completed

User can filter Active todos
    User has todo
    User completes a todo
    User checks if completed todo is NOT on Active tab

User can filter Completed todos
    User has todo
    User completes a todo
    User checks if completed todo is on Completed tab
