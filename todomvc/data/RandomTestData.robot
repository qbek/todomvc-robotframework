*** Settings ***
Library     FakerLibrary

*** Keywords ***
Setup $todoName test variable
    ${randomInt} =     Random Int    min=1    max=10
    ${name} =    Sentence    nb_words=${randomInt}
    Set Test Variable     $todoName      ${name}

Setup $fewTodoNames test variable
    ${randomInt} =     Random Int    min=2    max=5
    @{names} =     Sentences     nb=${randomInt}
    Set Test Variable     @fewTodoNames    @{names}