*** Settings ***
Resource    ../pageobjects/TodoInput.robot
Resource    ../pageobjects/TodosList.robot
Resource    ../pageobjects/TodoMVC.robot
Resource    ../data/${DATA}TestData.robot

*** Variables ***
@{broken} =     Pierwszezadanie       Trzecie zadanie     Czwarte zadanie2     Drugie zadanie


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
    Mark todo as completed     ${todoName}

User creates a few todos
    Setup $fewTodoNames test variable
    FOR   ${name}    IN     @{fewTodoNames}
        Create new todo     ${name}
    END
    # Create new todo      Hahaha... jeszcze jeden

User deletes the todo
    Delete todo     ${todoName}

User creates THE ONE
    Create new todo     THE ONE

User deletes THE ONE
    Delete todo       THE ONE