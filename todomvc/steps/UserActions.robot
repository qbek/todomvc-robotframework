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
    Setup $todoName test variable
    Create new todo     ${todoName}

User marks todo as completed
    Mark todo as completed

User creates a few todos
    FOR   ${name}    IN     @{fewTodoNames}
        Create new todo     ${name}
    END
    # Create new todo      Hahaha... jeszcze jeden