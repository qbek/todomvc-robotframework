*** Settings ***
Library    SeleniumWrapper.py
Library    String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_TOGGLE_COMPLETE} =   css:.todo-list .toggle
${TODO_DELETE} =   css:.todo-list .destroy
${TODO_ITEM} =     css:.todo-list li
${TODO_COMPLETITON_MARK} =    completed
${TODO_DESTROY_BUTTON} =    css:.destroy

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

    ${todo} =     Find a todo with name     ${name}
    ${todo_destroy} =   findInsideElement   ${TODO_DESTROY_BUTTON}    ${todo}
    Mouse over     ${todo}
    Click element    ${todo_destroy}

Find a todo with name
    [Arguments]   ${name}

    @{all_todos} =    Get WebElements     ${TODO_ITEM}
    FOR   ${todo}   IN   @{all_todos}
        ${todo_name} =    Get Text     ${todo}
        Return From Keyword If    '${todo_name}' == '${name}'     ${todo}
    END
