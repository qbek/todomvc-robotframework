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


User checks if all todos are created
    # FOR   ${todo}    IN    @{fewTodoNamesToCheck}
    #     Check if one of todos is on the list    ${todo}
    # END

    Check if all todos are on the list     @{fewTodoNames}
    

User chcekcs if todo is created
    Check if todo is on the list    ${todoName}

User completes a todo
    Complete todo

User checks if todo is marked as completed
    Check if todo is marked as completed
  
User checks if completed todo is NOT on Active tab
    Goto Active tab
    Check if todo is NOT on the list     ${todoName}

User checks if completed todo is on Completed tab
    Goto Completed tab
    Check if todo is on the list    ${todoName}