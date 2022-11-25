*** Keywords ***
Setup todoName test variable
    Set Test Variable    ${todoName}    Moje pierwsze zadabnie

Setup todoNames test variable
    @{names} =    Create List    Zadanie 1    Zadanie 2    Zadanie 4
    Set Test Variable    @{todoNames}    @{names}
