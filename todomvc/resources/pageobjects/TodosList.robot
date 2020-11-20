*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${TODOS_LIST} =     css:.todo-list

${TODO_ITEM} =    ${TODOS_LIST} li

${TODO_BY_NAME} =    ${TODO_ITEM}:nth-child(<INDEX>)
${TODO_BY_NAME_COMPLETE} =     ${TODO_BY_NAME} .toggle
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
    [Arguments]     ${name}
    ${index} =     get todo index by name     ${name}
    ${completeByName} =    Replace string    ${TODO_BY_NAME_COMPLETE}    <INDEX>     ${index}

    Select checkbox     ${completeByName}
    Capture page screenshot

Todo is marked as completed
    [Arguments]   ${name}
    ${index} =     get todo index by name     ${name}
    ${todoByName} =    Replace string    ${TODO_BY_NAME}    <INDEX>     ${index}

    ${classes} =   Get Element Attribute    ${todoByName}    class
    Should contain    ${classes}     completed
    Capture page screenshot

Get count of existing todos
    ${counter} =    Get element count    ${TODO_ITEM}
    Return from keyword    ${counter}

Delete a todo
    [Arguments]     ${name}
    ${index} =     get todo index by name     ${name}
    ${todoByName} =    Replace string    ${TODO_BY_NAME}    <INDEX>     ${index}
    Mouse over     ${todoByName}

    ${destroyByName} =     Replace string    ${TODO_BY_NAME_DELETE}    <INDEX>     ${index}
    Click element     ${destroyByName}


Get todo index by name
    [Arguments]    ${expected_name}
    @{todos} =    get webelements     ${TODO_ITEM}
    ${index} =    set Variable     ${1}

    FOR  ${todo}    IN    @{todos}
        ${todo_name} =    Get text      ${todo}
        ${index_str} =    Convert to string     ${index}
        Return From Keyword If    '${todo_name}' == '${expected_name}'   ${index_str}
        ${index} =     Evaluate     ${index} + ${1}
    END

