*** Settings ***
Library     SeleniumLibrary
Resource    ../pageobjects/todo_input_po.robot
Resource    ../pageobjects/todo_filters_po.robot
Resource    ../pageobjects/todo_list_po.robot


*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/dist/#/all
${BROWSER} =    firefox


*** Keywords ***
User opens TodoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}
    Wait until todo input is visible
    
User creates a new todo
    Enter todo name    ${todoName}  
    Submit todo by pressing Enter

    # Enter todo name     krotki
    # Enter todo name     bardzo dluzoglaksdgh ;laksdhg alksj ;lkdgs ;lgh as;dlgkahsdg
    # Enter todo name    !@#$%^&*

        
User verifies todo is created
    Todo is on the list    ${todoName}
    
User marks todo as completed
    Mark todo as completed

User checks if todo is marked as completed
    Todo is marked as completed
 
User checks if completed todo is NOT on Active list
    Go to Active filter
    Todo is NOT on the list    ${todoName}
    
User checks if completed todo is on Completed list
    Go to Completed filter
    Todo is on the list    ${todoName}

User colses TodoMVC app
    Close browser


User deletes created todo
    Move mouse over todo
    Delete todo


User checks todo is deleted
    Todo is NOT on the list

#--------------
User creates a new todo1
    Enter todo name      ${todoName1} 
    Submit todo by pressing Enter

User creates a new todo2
    Enter todo name      To jest todo22222222
    Submit todo by pressing Enter

User verifies todo1 is created
    Todo is on the list    ${todoName1} 

User verifies todo2 is created
    Todo is on the list    To jest todo22222222

#----------
User creates a specyfic todo
    Enter todo name    ${todoName}
    Submit todo by pressing Enter


User verifies specyfic todo is created
    Todo is on the list    ${todoName}

