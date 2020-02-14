*** Settings ***
Library   FakerLibrary

Resource   pageobjects/create_todo_input.robot
Resource   pageobjects/todo_tabs.robot
Resource   pageobjects/todos_list.robot
Resource   pageobjects/todos_counter.robot
Resource   env_setup.robot
Resource   ../testdata/${env}_env.robot

*** Keywords ***
user opens todoMVC app
    start the app


user creates a new todo
    ${todo_name} =   Paragraph
    Set test variable   ${test_todo_name}    ${todo_name}
    Add todo    ${test_todo_name}

user can see his todo on the list
    Todo is on the list    ${test_todo_name}

user completes a todo
    Complete a todo

user sees todo marked as completed
    Todo is displayed as completed

completed todo is not on the Active list
    Switch to active todos tab
    Todo is not on the list    ${test_todo_name}

completed todo is on Completed list
    Switch to completed todos tab
    Todo is on the list   ${test_todo_name}

user creates few todos
    ${todos_to_create} =    Random Int    min=1    max=4
    @{todos} =     Sentences    ${todos_to_create}
    FOR   ${todo_name}    IN    @{todos}
        Add todo    ${todo_name}
    END

todo counter show correct number
    ${todo_count} =   Count created todos
    Counter show value    ${todo_count}

user deletes a todo
    Delete a todo

deleted todo is not on the list
    Todo is not on the list    ${test_todo_name}

user creates The One
    Add todo    The One. DELETE ME!


user deleted The One
    