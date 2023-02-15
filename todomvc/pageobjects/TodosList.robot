*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_ITEM} =    ${TODOS_LIST} li
${TODO_ITEM_BY_INDEX} =     ${TODO_ITEM}:nth-child(<index>)
${TODO_DELETE_BUTTON_BY_INDEX} =     ${TODO_ITEM_BY_INDEX} .destroy
${TODO_COMPLETE_TOGGLE_BY_INDEX} =     ${TODO_ITEM_BY_INDEX} .toggle


*** Keywords ***
Check if todo is visible on the list
    [Arguments]    ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}
    Capture Page Screenshot


Check if all todos are visible
    [Arguments]    @{expectedNames}
    # FOR    ${name}   IN   @{names}
    #     Element Should Contain     ${TODOS_LIST}    ${name}
    # END
    # ${expectedCount} =     Get Length    ${names}
    # @{allTodos} =      Get WebElements     ${TODO_ITEM}
    # Length Should Be     ${allTodos}     ${expectedCount}    msg=There are wrong number of created todos

    @{createdNames} =    Get all todo names
    Lists Should Be Equal     ${createdNames}     ${expectedNames}    ignore_order=True
    

Check if todo in NOT visible on the list
    [Arguments]    ${name}
    Element Text Should Not Be     ${TODOS_LIST}     ${name}
 
Mark todo as completed
    [Arguments]    ${name}
    ${index} =      Find todo index by name     ${name}
    ${toggleByIndex} =    Replace String    ${TODO_COMPLETE_TOGGLE_BY_INDEX}    <index>   ${index}
    Select Checkbox     ${toggleByIndex}

Check if todo is marked as completed
    Element Attribute Value Should Be     ${TODO_ITEM}     class     completed

Delete todo
    [Arguments]     ${name}
    ${index} =      Find todo index by name     ${name}
    Log     Index: ${index}     console=True
    ${todoByIndex} =    Replace String    ${TODO_ITEM_BY_INDEX}     <index>      ${index}
    ${deleteByIndex} =    Replace String    ${TODO_DELETE_BUTTON_BY_INDEX}    <index>   ${index}
    Mouse Over    ${todoByIndex}
    Click element    ${deleteByIndex}

Get all todo names
    @{names} =    Create List
    @{allTodos} =      Get WebElements     ${TODO_ITEM}
    FOR    ${todo}    IN     @{allTodos}
        ${todoName} =    Get Text     ${todo}
        Append To List    ${names}     ${todoName}
    END
    Return From Keyword     @{names}

Find todo index by name
    [Arguments]    ${name}
    @{names} =    Get all todo names
    ${index} =    Get Index From List     ${names}     ${name}
    ${index} =    Evaluate     ${index} + 1
    ${indexStr} =    Convert To String    ${index}
    Return From Keyword    ${indexStr}

