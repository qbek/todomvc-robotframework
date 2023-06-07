*** Settings ***
Library    FakerLibrary

*** Keywords ***
Setup TODO_NAME variable
    Set Test Variable    ${TODO_NAME}    To jest moje zadanie

Setup FEW_TODO_NAMES variable
    @{names} =    Create List    Zadanie 1    Zadanie 2     Zadanie 3
    Set Test Variable    @{FEW_TODO_NAMES}    @{names}