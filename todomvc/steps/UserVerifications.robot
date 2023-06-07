*** Settings ***
Resource    ../pageobjects/todomvc.robot
Resource    ../pageobjects/TodosList.robot
Resource    ../pageobjects/TodoFilters.robot



*** Keywords ***
User checks if todo is marked as completed
    Verify if todo has class completed
    

User checks if completed todo is NOT on Active todos filter
    Go to active filter
    Verify todo is not on the list    ${TODO_NAME}


User checks if completed todo is on Completed todos filter
    Go to completed filter
    Verify todo is on the list    ${TODO_NAME}
    
User checks if todo was created
    Verify todo is on the list    ${TODO_NAME}

User checks if all todos are created
    # FOR   ${todoName}    IN    @{FEW_TODO_NAMES_TO_VERIFY}
    #     Verify list contains a todo    ${todoName}
    # END
    # ${expectedTodosCount} =    Get Length   ${FEW_TODO_NAMES_TO_VERIFY}
    # Verify list contains exact number of todos     ${expectedTodosCount}
    Verify if all todos are created    @{FEW_TODO_NAMES}