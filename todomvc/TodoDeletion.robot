*** Settings ***
Resource    steps/UserSteps.robot
Test Teardown   Close Browser

*** Test Cases ***
User can delete a todo
    User opens todoMVC app
    User creates a new todo
    User deletes the todo
    User checks if todo is deleted

