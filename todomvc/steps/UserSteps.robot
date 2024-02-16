*** Settings ***
Resource    ../pageobjects/TodoMVCPO.robot
Resource    ../pageobjects/NewTodoInputPO.robot
Resource    ../pageobjects/TodosFiltersPO.robot
Resource    ../pageobjects/TodosListPO.robot
Resource    ../data/DATA_${DATA}.robot


*** Keywords ***
User opens TodoMVC app
    Open TodoMVC app

User closes TodoMVC app
    Close TodoMVC app

User creates new todo
    Setup todoName test variable
    Enter todo name    ${todoName}
    Submit todo
    
User creates few todos
    Setup fewTodoNames test variable
    FOR   ${todo}    IN    @{fewTodoNames}
        Enter todo name    ${todo}
        Submit todo
    END

User creates THE ONE
    Enter todo name    THE ONE
    Submit todo

User checks if all todos are created
    # FOR   ${todo}    IN    @{fewTodoNamesToCheck}
    #     Check if one of todos is on the list    ${todo}
    # END

    Check if all todos are on the list     @{fewTodoNames}
    

User chcekcs if todo is created
    Check if todo is on the list    ${todoName}

User completes a todo
    Complete todo

User deletes todo
    Delete todo    ${todoName}

User deletes THE ONE
    Delete todo     THE ONE

User checks if todo is marked as completed
    Check if todo is marked as completed
  
User switch to Active filter
    Goto Active tab

User checks if todo is not displayed
    Check if todo is NOT on the list     ${todoName}

User checks if completed todo is on Completed tab
    Goto Completed tab
    Check if todo is on the list    ${todoName}

User checks if todo is deleted
    Check if todo is NOT on the list    ${todoName}