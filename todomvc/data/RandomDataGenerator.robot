*** Settings ***
Library    FakerLibrary

*** Keywords ***
Setup test variable todoName
    ${randomName} =     Sentence
    Set Test Variable     ${todoName}    ${randomName}

Setup test variable todosNames
    ${randomInt} =    Random Int   min=2   max=5
    @{randomNames} =     Sentences    nb=${randomInt}
    Set Test Variable    @{todosNames}    @{randomNames}