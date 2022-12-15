*** Settings ***
Test Teardown     Close Browser
Resource          steps/PreconditionSteps.robot
Resource          steps/ActionsSteps.robot
Resource          steps/VerificationSteps.robot

*** Test Cases ***
User can create a new todo
    User has TodoMVC app open
    User creates new todo
    User checks if new todo is listed
