*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_COMPLETE_TOGGLE} =     css:.todo-list .toggle
${TODO_ITEM} =     css:.todo-list li
${TODO_COMPLETE_MARK} =    completed

*** Keywords ***
List should contain todo
    [Arguments]    ${todo}
    Element Should Contain   ${TODOS_LIST}    ${todo}
    Capture Element Screenshot   ${TODOS_LIST}

List should not contain todo
    [Arguments]    ${todo}
    Element Should Not Contain    ${TODOS_LIST}    ${todo}
    Capture Element Screenshot   ${TODOS_LIST}

Complete todo
    Click Element    ${TODO_COMPLETE_TOGGLE}
    Capture Element Screenshot   ${TODOS_LIST}

Todo is completed
    ${classes} =    Get Element Attribute    ${TODO_ITEM}    class
    Should Contain    ${classes}    ${TODO_COMPLETE_MARK}
    Capture Element Screenshot   ${TODOS_LIST}

Get count of todos
    @{todos} =   Get WebElements     ${TODO_ITEM}
    ${size} =   Get Length    ${todos}
    Return From Keyword    ${size}