*** Settings ***
Resource          ../data/${TD}DataGenerator.robot
Resource          ../pageobjects/new_todo_input.robot
Resource          ../pageobjects/todos_list.robot
Resource          ../pageobjects/todo_filters.robot


*** Keywords ***
User creates new todo
    Setup test variable todoName
    Create todo    ${todoName}

User completes a todo
    Complete todo

User creates a few todos
    Setup test variable todosNames
    FOR    ${name}    IN    @{todosNames}
        Log    ${name}    console=True
        Create todo    ${name}
    END