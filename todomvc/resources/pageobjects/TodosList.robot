*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${TODOS_LIST} =   css:.todo-list
${TODO_ITEM} =    ${TODOS_LIST} li
${TODO_ITEM_BY_INDEX} =    ${TODO_ITEM}:nth-child(<INDEX>)
${TODO_ITEM_COMPLETE_TOGGLE} =   ${TODO_ITEM_BY_INDEX} .toggle


*** Keywords ***
Verify todo is on the list
    [Arguments]    ${expectedTodo}
    Element Should Contain    ${TODOS_LIST}    ${expectedTodo}
    Capture Page Screenshot

Verify todo is NOT on the list
    [Arguments]    ${expectedTodo}
    Element Should Not Contain    ${TODOS_LIST}    ${expectedTodo}
    Capture Page Screenshot

Complete todo
    [Arguments]     ${todoName}
    ${index} =    Find todo index by name      ${todoName}
    ${index_str} =     Convert To String    ${index}
    ${selector} =    Replace String    ${TODO_ITEM_COMPLETE_TOGGLE}    <INDEX>    ${index_str}
    Select Checkbox    ${selector}
    Capture Page Screenshot

Verify if todo is marked as completed
    [Arguments]    ${todoName}

    ${index} =    Find todo index by name      ${todoName}
    ${index_str} =     Convert To String    ${index}
    ${selector} =    Replace String    ${TODO_ITEM_BY_INDEX}    <INDEX>    ${index_str}

    ${classes} =  Get Element Attribute    ${selector}    class
    Should Contain    ${classes}    completed
    Capture Page Screenshot

Find todo index by name
    [Arguments]    ${expectedName}
    @{allTodos} =    Get WebElements    ${TODO_ITEM}
    ${index} =    Set variable   ${1}
    FOR     ${todo}    IN    @{allTodos}
        ${todoName} =    Get Text    ${todo}
        Return From Keyword If    '${todoName}' == '${expectedName}'    ${index}
        ${index} =   Evaluate    ${index} + 1
    END
