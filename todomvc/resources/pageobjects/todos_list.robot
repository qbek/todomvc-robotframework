*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =    ${TODOS_LIST} li
${COMPLETE_TODO} =   ${TODO} .toggle
${DELETE_BUTTON} =    ${TODO} .destroy


*** Keywords ***
Complete a todo
    Click element    ${COMPLETE_TODO}
    Capture page screenshot

Delete a todo
    Mouse over   ${TODO}
    Click element    ${DELETE_BUTTON}

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