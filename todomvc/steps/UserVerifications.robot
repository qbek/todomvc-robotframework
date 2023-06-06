*** Settings ***
Resource    ../pageobjects/todomvc.robot
Resource    ../pageobjects/TodosList.robot
Resource    ../pageobjects/TodoFilters.robot

*** Variables ***
${TODO_NAME} =    To jest lepsze zadanie


*** Keywords ***
User checks if todo is marked as completed
    Verify if todo has class completed
    

User checks if completed todo is NOT on Active todos filter
    Go to active filter
    Verify todo is not on the list    ${TODO_NAME}


User checks if completed todo is on Completed todos filter
    Go to completed filter
    Verify todo is on the list    ${TODO_NAME}
    
User checks if todo was created
    Verify todo is on the list    ${TODO_NAME}