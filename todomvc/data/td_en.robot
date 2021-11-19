*** Settings ***
Library    FakerLibrary


*** Keywords ***
Set test variable TODO_NAME
    ${name} =     Street name
    Set test variable    ${TODO_NAME}     ${name}


Set test variable TODO_NAMES
    ${nb} =    Random int    min=3    max=6
    @{names} =    Sentences    nb=${nb}
    Set test variable      @{TODO_NAMES}      @{names}