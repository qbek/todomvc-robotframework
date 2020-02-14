*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =    ${TODOS_LIST} li
${COMPLETE_TODO} =   ${TODO} .toggle
${DELETE_BUTTON} =    ${TODO} .destroy

${TODO_BY_INDEX} =    css:.todo-list li:nth-child(<INDEX>)
${DELETE_BUTTON_BY_INDEX} =    css:.todo-list li:nth-child(<INDEX>) .destroy

*** Keywords ***
Complete a todo
    Click element    ${COMPLETE_TODO}
    Capture page screenshot

Delete a todo
    Mouse over   ${TODO}
    Click element    ${DELETE_BUTTON}

Delete a todo by index
   [Arguments]    ${index}
   ${index_str} =    Convert to string   ${index}

   ${CUSTOM_TODO_SELECTOR} =    Replace string   ${TODO_BY_INDEX}   <INDEX>    ${index_str}
   ${CUSTOM_DELETE_SELECTOR} =    Replace string   ${DELETE_BUTTON_BY_INDEX}   <INDEX>    ${index_str}

   Mouse over    ${CUSTOM_TODO_SELECTOR}
   Click element    ${CUSTOM_DELETE_SELECTOR}


Todo is on the list
    [Arguments]    ${todo_name}
    Element should contain     ${TODOS_LIST}    ${todo_name}
    Capture page screenshot

Todo is not on the list
    [Arguments]    ${todo_name}
    Element should not contain     ${TODOS_LIST}    ${todo_name}
    Capture page screenshot

Todo is displayed as completed
    ${classes} =   Get Element Attribute    ${TODO}    class
    Should Contain   ${classes}    completed
    Capture page screenshot


Count created todos
    @{todos} =    Get WebElements    ${TODO}
    ${todos_count} =    Get length   ${todos}
    Return From Keyword    ${todos_count}


Get todo index
    [Arguments]   ${todo_name}
    @{todos} =    Get WebElements    ${TODO}
    ${index} =    Set variable   ${1}
    FOR    ${todo}     IN    @{todos}
        ${text} =   Get text    ${todo}
        Return From Keyword If    '${text}' == '${todo_name}'    ${index}
        ${index} =     Evaluate    ${index} + 1
    END


