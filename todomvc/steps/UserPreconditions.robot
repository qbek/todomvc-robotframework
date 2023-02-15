*** Settings ***
Resource     UserActions.robot
Resource     UserVerifications.robot


*** Keywords ***
User has a todo
    User creates a new todo
    User checks if todo was created
    

    