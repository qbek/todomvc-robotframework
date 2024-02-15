*** Settings ***
Resource    ../pageobjects/TodoMVCPO.robot
Resource    ../pageobjects/NewTodoInputPO.robot
Resource    ../pageobjects/TodosFiltersPO.robot
Resource    ../pageobjects/TodosListPO.robot


*** Variables ***
${todoName} =    Moje lepsze zadanie



*** Keywords ***
User opens TodoMVC app
    Open TodoMVC app

User closes TodoMVC app
    Close TodoMVC app

User creates new todo
    Enter todo name    ${todoName}
    Submit todo
    
User chcekcs if todo is created
    Check if todo is on the list    ${todoName}

User completes a todo
    Complete todo

User checks if todo is marked as completed
    Check if todo is marked as completed
  
User checks if completed todo is NOT on Active tab
    Goto Active tab
    Check if todo is NOT on the list     ${todoName}

User checks if completed todo is on Completed tab
    Goto Completed tab
    Check if todo is on the list    ${todoName}
