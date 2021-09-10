*** Keywords ***
Set test variable with todo name
    Set test variable    ${todoName}     Nauczyć się RF

Set test variable with few todos names
    @{todos} =    Create list    Nauczyć się RF     Cwiczyc RF      Opanować RF
    Set test variable    @{todosNames}    @{todos}