*** Settings ***
Library           FakerLibrary

*** Keywords ***
Setup todoName test variable
    ${name} =    Sentence
    Set Test Variable    ${todoName}    ${name}

Setup todoNames test variable
    ${nb} =    Random Int    min=2    max=5
    @{names} =    Sentences    nb=${nb}
    Set Test Variable    @{todoNames}    @{names}
