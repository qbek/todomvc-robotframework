*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODO_COUNTER} =    css:.todo-count strong


*** Keywords ***
Counter shows
    [Arguments]   ${expected_count}
    Element Text Should Be    ${TODO_COUNTER}     ${expected_count}


