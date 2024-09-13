*** Settings ***
Library     FakerLibrary


*** Keywords ***
Set todoName test data
    ${random} =    Sentence
    Set Test Variable  ${todoName}     ${random} 

Set todoNames test data
    ${nb} =    Random Int   min=2   max=5
    @{random} =    Sentences    nb=${nb}
    Set Test Variable   @{todoNames}    @{random}