*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_COMPLETE_TOGGLE} =     css:.todo-list .toggle
${TODO_ITEM} =     css:.todo-list li
${TODO_ITEM_BY_INDEX} =     css:.todo-list li:nth-child(<ID>)
${TODO_ITEM_LABELS} =   ${TODO_ITEM} label
${TODO_COMPLETE_MARK} =    completed
${TODO_DELETE} =    css:.todo-list .destroy
${TODO_DELETE_BY_INDEX} =    css:.todo-list li:nth-child(<ID>) .destroy

*** Keywords ***
List should contain todo
    [Arguments]    ${todo}
    Element Should Contain   ${TODOS_LIST}    ${todo}
    Capture Page Screenshot

List should not contain todo
    [Arguments]    ${todo}
    Element Should Not Contain    ${TODOS_LIST}    ${todo}
    Capture Page Screenshot

Complete todo
    Click Element    ${TODO_COMPLETE_TOGGLE}
    Capture Page Screenshot

Todo is completed
    ${classes} =    Get Element Attribute    ${TODO_ITEM}    class
    Should Contain    ${classes}    ${TODO_COMPLETE_MARK}
    Capture Page Screenshot

Get count of todos
    @{todos} =   Get WebElements     ${TODO_ITEM}
    ${size} =   Get Length    ${todos}
    Return From Keyword    ${size}

Delete todo
    Mouse Over    ${TODO_ITEM}
    Capture Page Screenshot
    Click Element    ${TODO_DELETE}
    Capture Page Screenshot

Delete todo by index
    [Arguments]    ${index}
    ${str_index} =   Convert To String    ${index}
    ${selector} =   Replace String    ${TODO_ITEM_BY_INDEX}    <ID>     ${str_index}
    Mouse Over    ${selector}
    Capture Page Screenshot
    ${selector} =   Replace String    ${TODO_DELETE_BY_INDEX}    <ID>     ${str_index}
    Click Element    ${selector}

Get index of todo
    [Arguments]   ${todo_name}
    @{labels} =   Get WebElements     ${TODO_ITEM_LABELS}
    ${index} =    Set Variable    ${0}
    FOR   ${label}    IN   @{labels}
        ${index} =    Evaluate     ${index} + 1
        ${text} =    Get Text   ${label}
        Log To Console    ${text}
        Return From Keyword If   '${text}' == '${todo_name}'     ${index}
    END