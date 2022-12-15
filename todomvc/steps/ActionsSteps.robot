*** Settings ***
Resource          ../pageobjects/new_todo_input.robot
Resource          ../pageobjects/todos_list.robot
Resource          ../pageobjects/todo_filters.robot

*** Variables ***
${todoName} =     Nowe lepsze zadanie
@{todosNames} =    Zadanie 1    Zadanie 2    Zadanie 3

*** Keywords ***
User creates new todo
    Create todo    ${todoName}

User completes a todo
    Complete todo

User creates a few todos
    FOR    ${name}    IN    @{todosNames}
        Log    ${name}    console=True
        Create todo    ${name}
    END
