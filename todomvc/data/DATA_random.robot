*** Settings ***
Library    FakerLibrary

*** Keywords ***
Setup todoName test variable
    ${randomName} =   Catch Phrase
    Set Test Variable    $todoName     ${randomName}

Setup fewTodoNames test variable
    ${randomInt} =    Random Int   min=2   max=5
    @{randomNames} =     Sentences    nb=${randomInt}
    Set Test Variable    @fewTodoNames    @{randomNames}