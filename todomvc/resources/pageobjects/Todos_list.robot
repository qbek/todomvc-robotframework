*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =    ${TODOS_LIST} li
${COMPLETE_TODO} =   ${TODO} .toggle
${DELETE_TODO} =    ${TODO} .destroy

${TODO_BY_INDEX} =    css:.todo-list li:nth-child(INDEX)
${DELET_TODO_BY_INDEX} =    css:.todo-list li:nth-child(INDEX) .destroy


*** Keywords ***
Complete a todo
    Click element    ${COMPLETE_TODO}
    Capture page screenshot

Delete a todo
    Mouse Over    ${TODO}
    Click Element    ${DELETE_TODO}

Delete todo with name
    [Arguments]    ${todo_to_delete}
    ${index} =    Find index of todo     ${todo_to_delete}
    ${todo_selector} =   Prepare todo selector by index    ${index}
    ${del_selector} =    Prepare delete selector by index    ${index}
    Mouse Over    ${todo_selector}
    Click Element    ${del_selector}

Find index of todo
    [Arguments]   ${expected_name}
    @{todos} =   Get WebElements    ${TODO}
    ${index} =   Set variable    ${1}

    FOR  ${todo}   IN    @{todos}
      ${name} =   Get text    ${todo}
      Log to console   ${name}
      Return From Keyword If     '${name}' == '${expected_name}'     ${index}
      ${index} =   Evaluate    ${index} + 1
    END

Todo is on the list
    [Arguments]    ${todo_name}
    Element should contain     ${TODOS_LIST}    ${todo_name}

Todo is not on the list
    [Arguments]    ${todo_name}
    Element should not contain     ${TODOS_LIST}    ${todo_name}

Todo is displayed as completed
    Capture page screenshot
    ${classes} =   Get Element Attribute    ${TODO}    class
    Should Contain   ${classes}    completedd

Calculate todos count
    ${count} =   Get Element Count     ${TODO}
    Return from keyword    ${count}

Prepare delete selector by index
    [Arguments]   ${index}
    ${str} =    Convert To String    ${index}
    ${result} =   Replace String    ${DELET_TODO_BY_INDEX}    INDEX    ${str}
    Return From Keyword    ${result}

Prepare todo selector by index
    [Arguments]   ${index}
    ${str} =    Convert To String    ${index}
    ${result} =   Replace String    ${TODO_BY_INDEX}    INDEX    ${str}
    Return From Keyword    ${result}
