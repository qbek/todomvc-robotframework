*** Settings ***
Resource  ../Resources/User.robot
Resource  ../Resources/Setup.robot

Test Setup  Open TodoMVC
Test Teardown  Close TodoMVC

*** Test Cases ***
User can add a todo
    [Documentation]  Verify if user can add a single todo
    [Tags]  smoke

    User creates new todo
    User can see his todo is added to the list

User can add multiple todos
    [Documentation]  Verify if user can add more then one todo

    User creates couple of todos
    User sees all his todos are added to the list
    User sees correct count of remaining todos

