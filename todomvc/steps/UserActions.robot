*** Settings ***
Resource    ../data/data_random.robot
Resource    ../pageobjects/todomvc.robot
Resource    ../pageobjects/NewTodoInput.robot
Resource    ../pageobjects/TodosList.robot


*** Variables ***
# ${TODO_NAME} =   To jest lepsze zadanie
# @{FEW_TODO_NAMES} =   Zadanie 1    Zadanie 2    Zadanie 3
# @{FEW_TODO_NAMES_TO_VERIFY} =   Zadanie 3     Zadanie 1    Zadanie 2     


*** Keywords ***
User opens TodoMVC app
    Open TodoMVC app
    Wait for new todo input to be rendered

User creates a new todo
    Setup TODO_NAME variable 
    Create todo    ${TODO_NAME}
 
   
User completes the todo
    Complete todo
    
User creates a few todos
    Setup FEW_TODO_NAMES variable
    FOR   ${todoName}    IN    @{FEW_TODO_NAMES}
        Create todo    ${todoName}
    END

User deletes todo
    Delete todo
   
