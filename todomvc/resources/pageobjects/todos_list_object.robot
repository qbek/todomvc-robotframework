*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_TOGGLE_COMPLETE} =   css:.todo-list .toggle
${TODO_DELETE} =   css:.todo-list .destroy
${TODO_ITEM} =     css:.todo-list li
${TODO_COMPLETITON_MARK} =    completed

${TODO_ITEM_BY_INDEX} =    css:.todo-list li:nth-child(<INDEX>)
${TODO_DELETE_BY_INDEX} =   css:.todo-list li:nth-child(<INDEX>) .destroy

*** Keywords ***
Todo is on the list
    [Arguments]    ${name}
    Element Text Should Be    ${TODOS_LIST}     ${name}
    Capture page screenshot

Todo is NOT on the list
    [Arguments]    ${name}
    Element Text Should Not Be    ${TODOS_LIST}     ${name}
    Capture page screenshot

Mark todo as completed
    Click element    ${TODO_TOGGLE_COMPLETE}
    Capture page screenshot

Todo is marked as completed
    ${classes} =    Get Element Attribute     ${TODO_ITEM}    class
    Should Contain    ${classes}    ${TODO_COMPLETITON_MARK}
    Capture page screenshot


Delete todo with name
    [Arguments]   ${name}

    ${index} =     Find a todo index with name     ${name}
    ${index_str} =   Convert To String    ${index}
    ${todo_by_index} =    Replace string   ${TODO_ITEM_BY_INDEX}      <INDEX>     ${index_str}
    ${delete_by_index} =    Replace string   ${TODO_DELETE_BY_INDEX}      <INDEX>     ${index_str}

    Mouse over     ${todo_by_index}
    Click element    ${delete_by_index}

Find a todo index with name
    [Arguments]   ${name}
    @{all_todos} =    Get WebElements     ${TODO_ITEM}
    ${index} =      Set variable    ${1}
    FOR   ${todo}   IN   @{all_todos}
        ${todo_name} =    Get Text     ${todo}
        Return From Keyword If    '${todo_name}' == '${name}'     ${index}
        ${index} =    Evaluate    ${index} + 1
    END


