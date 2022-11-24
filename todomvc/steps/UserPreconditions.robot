*** Settings ***
Resource          UserActions.robot

*** Keywords ***
User has TodoMVC app opened
    Open Browser    ${TODOMVC_URL}    firefox
    Wait Until Element Is Visible    ${NEW_TODO}

User has created todo
    User creates a new todo
    User checks if todo was created
