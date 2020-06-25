*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =    ${TODOS_LIST} li
${COMPLETE_TODO} =   ${TODO} .toggle


*** Keywords ***
Complete a todo
    Click element    ${COMPLETE_TODO}
    Capture page screenshot

Todo is on the list
    [Arguments]    ${todo_name}
    Element should contain     ${TODOS_LIST}    ${todo_name}

Todo is not on the list
    [Arguments]    ${todo_name}
    Element should not contain     ${TODOS_LIST}    ${todo_name}

Todo is displayed as completed
    Capture page screenshot
    ${classes} =   Get Element Attribute    ${TODO}    class
    Should Contain   ${classes}    completedd
