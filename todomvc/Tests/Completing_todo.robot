*** Settings ***
Resource  ../Resources/User.robot
Resource  ../Resources/Setup.robot


Test Setup  Open TodoMVC
Test Teardown  Close TodoMVC

*** Test Cases ***
User can complete a todo
    [Documentation]  Verify if user can add a single todo
    [Tags]  smoke

    User creates new todo
    User completes created todo
    Todo is marked as completed

Completed todos not on Activation Pane
    User creates new todo
    User completes created todo
    User switches to Active pane
    Todo is not on list


Completed todos listed on Completed pane
    User creates new todo
    User completes created todo
    User switches to Completed pane
    Todo is on list