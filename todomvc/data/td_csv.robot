*** Keywords ***
Set todo name for test
    Set Test Variable    ${todoName}     jestem z CSV

Set todos names for test
    @{list} =     Create List    CSV1    CSV2
    Set Test Variable   @{todoNames}    @{list}