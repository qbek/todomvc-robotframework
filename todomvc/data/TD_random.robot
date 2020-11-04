*** Settings ***
Library    FakerLibrary

*** Keywords ***
Setup test variable TODO_NAME
    ${todo} =    Sentence
    Set test variable    ${TODO_NAME}    ${todo}

Setup test variable TODOS_NAME
    ${nb_value} =     Random int    min=2   max=4
    @{todos} =   Sentences    nb=${nb_value}
    Set test variable    @{TODOS_NAME}       @{todos}