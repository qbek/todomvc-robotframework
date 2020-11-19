*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${TODOS_LIST} =     css:.todo-list

${TODO_ITEM} =    css:.todo-list li
${TODO_COMPLETE} =    css:.todo-list li .toggle


*** Keywords ***
Todo is on the list
    [Arguments]     ${name}
    Element text should be     ${TODOS_LIST}      ${name}
    Capture page screenshot   filename=special.png

Todo is NOT on the list
    [Arguments]    ${name}
    Element should not contain     ${TODOS_LIST}      ${name}
    Capture page screenshot

Complete a todo
    Select checkbox     ${TODO_COMPLETE}
    Capture page screenshot

Todo is marked as completed
    ${classes} =   Get Element Attribute    ${TODO_ITEM}    class
    Should contain    ${classes}     completed
    Capture page screenshot

Get count of existing todos
    ${counter} =    Get element count    ${TODO_ITEM}
    Return from keyword    ${counter}