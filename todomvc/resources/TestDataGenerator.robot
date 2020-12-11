*** Settings ***
Library    FakerLibrary

*** Keywords ***
Generate random todo names
    ${nb} =    Random Int    min=2     max=6
    @{sentences} =     Sentences    nb=${nb}
    Set Test Variable    @{TODO_NAMES}    @{sentences}
