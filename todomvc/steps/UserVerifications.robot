*** Settings ***
Resource    ../pageobjects/TodosList.robot
Resource    ../pageobjects/TodoFilters.robot
Resource    ../data/TestData.robot


*** Keywords ***
User checks if todo was created
    Check if todo is visible on the list    ${todoName}

User checks if todo is marked as completed
    Check if todo is marked as completed

User checks if completed todo is NOT on Active list
    Goto Active filter
    Check if todo in NOT visible on the list     ${todoName}

User checks if completed todo is on Completed list
    Goto Completed filter
    Check if todo is visible on the list     ${todoName}
