*** Settings ***
Resource    UserSteps.robot

*** Keywords ***

User has a todo
    User creates new todo
    User chcekcs if todo is created   


User has completed todo
    User creates new todo
    User completes a todo