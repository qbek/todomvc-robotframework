*** Settings ***
Library     FakerLibrary

*** Variables ***
@{fewTodoNames} =     Pierwsze zadanie    Drugie zadanie     Trzecie zadanie     Czwarte zadanie


*** Keywords ***
Setup $todoName test variable
    ${randomInt} =     Random Int    min=1    max=10
    ${name} =    Sentence    nb_words=${randomInt}
    Set Test Variable     $todoName      ${name}