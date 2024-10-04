*** Keywords ***
Set todo name for test
    Set Test Variable    ${todoName}     Statyczna nazwa todo

Set todos names for test
    @{list} =     Create List    Z1    Z2    Z3
    Set Test Variable   @{todoNames}    @{list}