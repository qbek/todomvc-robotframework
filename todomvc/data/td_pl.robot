*** Settings ***
Library    FakerLibrary


*** Keywords ***
Set test variable TODO_NAME
    Set test variable    ${TODO_NAME}     Nauczyć się RobotFramework


Set test variable TODO_NAMES
    @{names} =    Create list     Nauczyć się RobotFramework     Cwiczyć RobotFramework    Wymasterowac RobotFramewor
    Set test variable      @{TODO_NAMES}      @{names}