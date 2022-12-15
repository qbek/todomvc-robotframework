*** Settings ***
Resource          ActionsSteps.robot
Resource          VerificationSteps.robot
Resource          ../pageobjects/new_todo_input.robot

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all

*** Keywords ***
User has TodoMVC app open
    Open Browser    ${TODOMVC_URL}    firefox
    Wait until todo input visible

User has todo
    User creates new todo
    User checks if new todo is listed
