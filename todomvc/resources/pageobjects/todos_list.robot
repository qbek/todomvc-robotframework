*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_ITEM} =     ${TODOS_LIST} li
${TODO_ITEM_COMPLETE_TOGGLE} =     ${TODO_ITEM} .toggle

${TODO_ITEM_BY_INDEX} =    ${TODOS_LIST} li:nth-child(<INDEX>)
${TODO_ITEM_DELETE_BY_INDEX} =     ${TODO_ITEM_BY_INDEX} .destroy



*** Keywords ***
Check if todo is visible
    [Arguments]     ${name}
    Element text should be    ${TODO_ITEM}    ${name}
    Capture page screenshot

Check if todo is on the list
    [Arguments]     ${name}
    Element should contain    ${TODOS_LIST}    ${name}
    Capture page screenshot

Check if todo is NOT visible
    [Arguments]      ${name}
    Element text should not be    ${TODOS_LIST}    ${name}
    Capture page screenshot

Check if todo is marked as completed
    Element Attribute Value Should Be      ${TODO_ITEM}      class      completed
    Capture page screenshot
    #Page Should Contain Element      css:.completed

Complete todo
    Click element    ${TODO_ITEM_COMPLETE_TOGGLE}

Delete todo
    [Arguments]   ${name}
    ${id} =    Find todo index by name     ${name}
    ${id_str} =     Convert To String    ${id}
    ${todoToMO} =   Replace String   ${TODO_ITEM_BY_INDEX}    <INDEX>     ${id_str}
    ${todoToDel} =   Replace String   ${TODO_ITEM_DELETE_BY_INDEX}    <INDEX>     ${id_str}
    Mouse Over    ${todoToMO}
    Click element    ${todoToDel}


Find todo index by name
    [Arguments]    ${name}
    @{todos} =    Get WebElements    ${TODO_ITEM}
    ${index} =    Set variable    ${1}

    FOR   ${todo}    IN     @{todos}
        ${actual} =     Get text    ${todo}
        Return From Keyword If    '${actual}' == '${name}'    ${index}
        ${index} =     Evaluate     ${index} + ${1}
    END



Get count of existing todos
    ${count} =     Get Element Count    ${TODO_ITEM}
    Return from keyword     ${count}