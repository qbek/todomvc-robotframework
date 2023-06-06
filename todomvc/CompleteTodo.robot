*** Settings ***
Resource   steps/UserActions.robot
Resource   steps/UserVerifications.robot
Test Teardown    Close browser


*** Test Cases ***
User can complete a todo
    User opens TodoMVC app
    User creates a new todo
    User completes the todo
    User checks if todo is marked as completed

User can filter out completed todos on Active filter
    User opens TodoMVC app
    User creates a new todo
    User completes the todo
    User checks if completed todo is NOT on Active todos filter

User can filter out completed todos on Completed filter
    User opens TodoMVC app
    User creates a new todo
    User completes the todo
    User checks if completed todo is on Completed todos filter

