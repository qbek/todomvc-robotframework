*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =         css:.todo-list li
${COMPLETE_TODO} =    css:.toggle
${TODO_BY_INDEX} =    ${TODO}:nth-child(<INDEX>)
${DELETE_TODO_BY_INDEX} =    ${TODO_BY_INDEX} .destroy

*** Keywords ***
Todo is on the list
    [Arguments]    ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

All todos are on the list
    [Arguments]    @{expectedNames}
    @{allNames} =    Get all todos names
    Lists Should Be Equal    ${allNames}    ${expectedNames}

Todo is NOT on the list
    [Arguments]    ${name}
    Element Text Should Not Be    ${TODOS_LIST}    ${name}

Complete todo
    Select Checkbox    ${COMPLETE_TODO}

Check if todo marked as completed
    Element Attribute Value Should Be    ${TODO}    class    completed

Delete todo
    [Arguments]    ${name}
    ${index} =    Find todo index by name    ${name}
    ${todo_mouseOver} =    Replace string    ${TODO_BY_INDEX}    <INDEX>    ${index}
    ${todo_delete} =    Replace String    ${DELETE_TODO_BY_INDEX}    <INDEX>    ${index}
    Mouse Over    ${todo_mouseOver}
    Click Button    ${todo_delete}

Find todo index by name
    [Arguments]    ${name}
    @{allNames} =    Get all todos names
    ${idx} =    Get Index From List    ${allNames}    ${name}
    ${idx} =    Evaluate    ${idx} + 1
    ${idx_str} =    Convert To String    ${idx}
    Return From Keyword    ${idx_str}

Get all todos names
    @{allTodos} =    Get WebElements    ${TODO}
    @{allNames} =    Create List
    FOR    ${todo}    IN    @{allTodos}
        ${name} =    Get text    ${todo}
        Append To List    ${allNames}    ${name}
    END
    Return From Keyword    @{allNames}
