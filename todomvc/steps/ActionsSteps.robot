*** Settings ***
Resource          ../pageobjects/new_todo_input.robot
Resource          ../pageobjects/todos_list.robot
Resource          ../pageobjects/todo_filters.robot

*** Variables ***
${todoName} =     Nowe lepsze zadanie

*** Keywords ***
User creates new todo
    Create todo    ${todoName}

User completes a todo
    Complete todo
