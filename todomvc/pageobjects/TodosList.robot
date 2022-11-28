*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =         css:.todo-list li
${COMPLETE_TODO} =    css:.toggle
${DELETE_TODO} =    css:.destroy
${TODO_BY_INDEX} =    ${TODO}:nth-child(<INDEX>)
${DELETE_TODO_BY_INDEX} =    ${TODO_BY_INDEX} .destroy

*** Keywords ***
Todo is on the list
    [Arguments]    ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

All todos are on the list
    [Arguments]    @{expectedNames}
    @{allTodos} =    Get WebElements    ${TODO}
    @{allNames} =    Create List
    FOR    ${todo}    IN    @{allTodos}
        ${name} =    Get text    ${todo}
        Append To List    ${allNames}    ${name}
    END
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
    ${idx_str} =    Convert To String    ${index}
    ${todo_mouseOver} =    Replace string    ${TODO_BY_INDEX}    <INDEX>    ${idx_str}
    ${todo_delete} =    Replace String    ${DELETE_TODO_BY_INDEX}    <INDEX>    ${idx_str}
    Mouse Over    ${todo_mouseOver}
    Click Button    ${todo_delete}

Find todo index by name
    [Arguments]    ${name}
    @{allTodos} =    Get WebElements    ${TODO}
    ${idx} =    Set Variable    ${1}
    FOR    ${todo}    IN    @{allTodos}
        ${todoName} =    Get Text    ${todo}
        Log    ${idx} - ${todoName}    console=True
        Return From Keyword If    '${todoName}' == '${name}'    ${idx}
        ${idx} =    Evaluate    ${idx} + 1
    END
