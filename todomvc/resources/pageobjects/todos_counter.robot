*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${COUNTER} =    css:.todo-count

*** Keywords ***
Counter show value
    [Arguments]    ${value}
    ${val_str} =    Convert to string    ${value}
    Element should contain    ${COUNTER}    ${val_str}