*** Settings ***
Resource    ../pageobjects/TodoInput.robot
Resource    ../pageobjects/TodosList.robot
Resource    ../pageobjects/TodoMVC.robot
Resource    ../data/TestData.robot


*** Keywords ***
User opens TodoMVC app
    Open TodoMVC app
    Wait until todo input is renderd

User closes TodoMVC app
    Close TodoMVC app

User creates a new todo
    Create new todo     ${todoName}

User marks todo as completed
    Mark todo as completed


