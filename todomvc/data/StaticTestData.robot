*** Keywords ***
Setup $todoName test variable
    Set Test Variable     $todoName      Moje pierwsze zadanie

Setup $fewTodoNames test variable  
    @{names} =  Create List    Pierwsze zadanie     Drugie zadanie    Trzecie zadanie
    Set Test Variable     @fewTodoNames    @{names}