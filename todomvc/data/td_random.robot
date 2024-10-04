*** Settings ***
Library    FakerLibrary


*** Keywords ***
Set todo name for test
    ${random_name} =    Sentence
    Set Test Variable    ${todoName}    ${random_name}

Set todos names for test
    @{random_names} =    Sentences
    Set Test Variable   @{todoNames}    @{random_names}