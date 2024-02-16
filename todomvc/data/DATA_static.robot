*** Keywords ***
Setup todoName test variable
    Set Test Variable    $todoName     Jestem statycznym zadaniem

Setup fewTodoNames test variable
    @{names} =    Create List     Zadanie 1     Zadanie 2     Zadanie 3
    Set Test Variable     @fewTodoNames     @{names}