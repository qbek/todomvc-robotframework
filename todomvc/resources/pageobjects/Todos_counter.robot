*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${COUNTER} =    css:.todo-count

*** Keywords ***
Check if counter shows value
    [Arguments]    ${value}
    ${val_str} =    Convert to string    ${value}
    ${expected} =    Catenate    ${val_str}    items left
    Element text should be    ${COUNTER}    ${expected}
