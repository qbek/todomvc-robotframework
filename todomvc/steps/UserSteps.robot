*** Settings ***
Resource   ../pageobjects/NewTodoInput.robot
Resource   ../pageobjects/TodosList.robot
Resource   ../pageobjects/Filters.robot
Resource   ../pageobjects/TodoMVCapp.robot

*** Variables ***
${todoName} =  Moje pierwsze zadanie z dluga nazwa

@{todoNames} =   Zadanie 2    Zadanie 3   Zadanie 6



*** Keywords ***
User opens todoMVC app
    Start TodoMVC app

User creates a new todo
    Enter todo name    ${todoName}
    Submit todo
    
User creates a few todos
    FOR    ${todo}   IN   @{todoNames}
        Enter todo name    ${todo}
        Submit todo
    END

User checks if todo is crectly created
    Only todo exists on the list    ${todoName}

User checks if all todos are created
    All todos exists on the list    @{todoNames}
 
    
User marks todo as completed
    Select todo complete checkbox
    
User checks if todo is marked as completed
    Check todo has completed class
        
User deletes the todo
    Hover todo item
    Click delete button

User checks if todo is deleted
    Todo is not on the list    ${todoName}

User switches to Active todos filter
    Go to Active tab

User checks if completed todo is not displayed
    Todo is not on the list    ${todoName}

User switches to Completed todos filter
    Go to Completed tab

User checks if completed todo is displayed
    Only todo exists on the list    ${todoName}