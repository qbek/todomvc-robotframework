*** Settings ***
Library     FakerLibrary

*** Variables ***
${BROWSER} =   firefox
${TODOMVC_URL} =     http://todomvc.com/examples/angularjs/#/

*** Keywords ***
Set a TODO_NAME test variable
    ${nb} =     Random Int    min=1    max=5
    ${todo} =     Sentence     nb_words=${nb}
    Set test variable     ${TODO_NAME}    ${todo}

Set a FEW_TODO_NAMES test variable
    ${nb} =     Random Int    min=1    max=4
    @{todos} =     Sentences     nb=${nb}
    Set test variable     @{FEW_TODO_NAMES}    @{todos}