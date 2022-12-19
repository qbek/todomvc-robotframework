*** Settings ***
Resource          steps/PreconditionSteps.robot
Resource          steps/ActionsSteps.robot
Resource          steps/VerificationSteps.robot
Test Setup        User has TodoMVC app open
Test Teardown     Close Browser

*** Test Cases ***
User can delete todo
    Given User has todo
    When User deletes todo
    Then User checks if deleted todo is not listed

User can delete THE ONE
    User creates a few todos
    User create THE ONE
    User creates a few todos
    Sleep   1s
    User deletes THE ONE
    Sleep   1s