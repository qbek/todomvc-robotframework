*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${TODOS_LIST} =     css:.todo-list

${TODO_ITEM} =    css:.todo-list li
${TODO_COMPLETE} =    css:.todo-list li .toggle
${TODO_DELETE} =    css:.todo-list li .destroy


${TODO_BY_NAME} =    css:.todo-list li:nth-child(<INDEX>)
${TODO_BY_NAME_DELETE} =     ${TODO_BY_NAME} .destroy


*** Keywords ***
Todo is on the list
    [Arguments]     ${name}
    Element text should be     ${TODOS_LIST}      ${name}
    Capture page screenshot   filename=special.png

Todo is NOT on the list
    [Arguments]    ${name}
    Element should not contain     ${TODOS_LIST}      ${name}
    Capture page screenshot

Complete a todo
    Select checkbox     ${TODO_COMPLETE}
    Capture page screenshot

Todo is marked as completed
    ${classes} =   Get Element Attribute    ${TODO_ITEM}    class
    Should contain    ${classes}     completed
    Capture page screenshot

Get count of existing todos
    ${counter} =    Get element count    ${TODO_ITEM}
    Return from keyword    ${counter}

Delete a todo
    [Arguments]     ${expected_name}
    @{todos} =    get webelements     ${TODO_ITEM}
    ${index} =    set Variable     ${1}
    Log     ${TODO_BY_NAME}    console=true
    FOR  ${todo}    IN    @{todos}
        ${todo_name} =    Get text      ${todo}
        Exit for loop if    '${todo_name}' == '${expected_name}'
        ${index} =     Evaluate     ${index} + ${1}
    END
    Log     ${index}    console=true
    Log     ${TODO_BY_NAME}    console=true
    ${index_str} =    Convert to string     ${index}
    ${todoByName} =    Replace string    ${TODO_BY_NAME}    <INDEX>     ${index_str}
    Mouse over     ${todoByName}

    ${destroyByName} =     Replace string    ${TODO_BY_NAME_DELETE}    <INDEX>     ${index_str}
    Click element     ${destroyByName}
