*** Settings ***
Resource    UserSteps.robot

*** Keywords ***
User has a todo created
    User creates a new todo
    User checks if todo is crectly created

User has completed todo
    User creates a new todo
    User marks todo as completed
    User checks if todo is marked as completed