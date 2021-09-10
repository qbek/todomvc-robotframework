*** Settings ***
Library    FakerLibrary


*** Keywords ***
Set test variable with todo name
    ${name} =    Sentence
    Set test variable    ${todoName}     ${name}

Set test variable with few todos names
    ${count} =    Random Int   min=2    max=5
    @{names} =    Sentences    nb=${count}
    Set test variable    @{todosNames}    @{names}