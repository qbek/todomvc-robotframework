*** Settings ***
Resource   resources/UserActions.robot
Test Teardown    Close browser


*** Test Cases ***
User can complete a todo
    User opens TodoMVC application
    User creates a new todo
    User completes a todo
    User checks if todo is completed
    User checks if todo is NOT on Active tab
    User checks if todo is on Completed tab