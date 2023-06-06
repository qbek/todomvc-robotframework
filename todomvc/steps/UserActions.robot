*** Settings ***
Resource    ../pageobjects/todomvc.robot
Resource    ../pageobjects/NewTodoInput.robot
Resource    ../pageobjects/TodosList.robot


*** Variables ***
${TODO_NAME} =    To jest lepsze zadanie

*** Keywords ***
User opens TodoMVC app
    Open TodoMVC app
    Wait for new todo input to be rendered

User creates a new todo
    Create todo    ${TODO_NAME}

    
User completes the todo
    Complete todo
    

