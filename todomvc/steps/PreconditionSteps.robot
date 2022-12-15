*** Settings ***
Resource          ActionsSteps.robot

*** Keywords ***
User has todo
    User creates new todo
    User checks if new todo is listed
