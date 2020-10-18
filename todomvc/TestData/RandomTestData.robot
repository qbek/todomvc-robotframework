*** Settings ***
Library    FakerLibrary


*** Keywords ***
Setup a todo-title test variable
    ${name} =    Sentence
    Set Test Variable    ${todo-title}    ${name}

Setup a todo-titles test variable
    ${tc} =   Random Int     min=3   max=10
    @{sentences} =   Sentences    nb=${tc}
    Set Test Variable    @{todo-titles}    @{sentences}
