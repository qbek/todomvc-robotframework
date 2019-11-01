*** Variables ***
${myVariable} =     Initial value

*** Test Cases ***
Variables usage
    log     ${myVariable}       console=true
    ${myVariable} =     Set Variable    changed value
    log     ${myVariable}       console=true
    ${additionalVariable}       SetVariable     my second var

Variables scope
    log     ${myVariable}       console=true
    log     ${additionalVariable}       console=true


List usage example
    @{myList} =    Set Variable   This is first element    Second    5
    Log    @{myList}[0]
    Log    @{myList}[1]
    Log    @{myList}[2]+${1}    console=true

Arytmetic operations
    @{myList} =    Create List   This is first element    Second    5
    ${test} =    Evaluate    @{myList}[2]+1