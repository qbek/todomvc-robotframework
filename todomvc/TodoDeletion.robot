*** Settings ***
Resource    steps/UserSteps.robot
Resource    steps/UserPreconditions.robot
Test Teardown   Close Browser
Test Setup    User opens todoMVC app

*** Test Cases ***
User can delete a todo    
    User has a todo created
    User deletes the todo
    User checks if todo is deleted
