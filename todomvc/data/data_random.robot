*** Settings ***
Library    FakerLibrary

*** Keywords ***
Setup TODO_NAME variable
    ${name} =    Sentence
    Set Test Variable    ${TODO_NAME}    ${name}

Setup FEW_TODO_NAMES variable
    ${randomNumber} =    Random Int   min=2    max=8
    @{names} =    Sentences   nb=${randomNumber}
    Set Test Variable    @{FEW_TODO_NAMES}    @{names}