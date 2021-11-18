*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODO_LIST} =    css:.todo-list
${TODO_ELEMENT} =   css:.todo-list li
${TODO_COMPLETE_CHECKBOX} =    css:.todo-list li .toggle

*** Keywords ***
Check if todo is on the list
    [Arguments]   ${name}
    Element text should be     ${TODO_ELEMENT}     ${name}
    Capture page screenshot

Check if todo is NOT on the list
    [Arguments]   ${name}
    Element Should Not Contain     ${TODO_LIST}    ${name}
    Capture page screenshot

Check if todo is completed
    Element attribute value should be     ${TODO_ELEMENT}     class     completed
    Capture page screenshot

Complete todo
    Select checkbox   ${TODO_COMPLETE_CHECKBOX}
    Capture page screenshot