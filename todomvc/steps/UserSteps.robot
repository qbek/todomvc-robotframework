*** Settings ***
Library    SeleniumLibrary
Resource   ../pageobjects/NewTodoInput.robot
Resource   ../pageobjects/TodosList.robot
Resource   ../pageobjects/Filters.robot

*** Variables ***
${BROWSER} =   firefox
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/dist/#/all

${todoName} =  Moje pierwsze zadanie z dluga nazwa

*** Keywords ***
User opens todoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}

User creates a new todo
    Enter todo name    ${todoName}
    Submit todo
    
User checks if todo is crectly created
    Todo exists on the list    ${todoName}
    
User marks todo as completed
    Select todo complete checkbox
    
User checks if todo is marked as completed
    Check todo has completed class
    
User checks if completed todo is NOT on Active list
    Go to Active tab
    Todo is not on the list    ${todoName}
    
User checks if completed todo is on Completed list
    Go to Completed tab
    Todo exists on the list    ${todoName}