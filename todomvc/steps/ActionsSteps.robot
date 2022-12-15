*** Settings ***
Library           SeleniumLibrary
Resource          ../pageobjects/new_todo_input.robot
Resource          ../pageobjects/todos_list.robot

*** Variables ***
${todoName} =     Nowe lepsze zadanie


*** Keywords ***
User creates new todo
    Create todo    ${todoName}

User checks if new todo is listed
    Check if todo is listed    ${todoName}

User completes a todo
    Complete todo

User checks if todo is marked as completed
    Check if todo completed

User checks if completed todo is NOT on Active tab
    Click Element    ${ACTIVE_FILTER}
    Check if todo is NOT listed    ${todoName}

User checks if completed todo is on Completed tab
    Click Element    ${COMPLETED_FILTER}
    Check if todo is listed    ${todoName}
