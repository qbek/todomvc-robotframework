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

Todo is NOT on the list
    [Arguments]    ${name}
    Element should not contain     ${TODOS_LIST}      ${name}

Complete a todo
    Select checkbox     ${TODO_COMPLETE}