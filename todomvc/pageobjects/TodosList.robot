*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_ITEM} =    ${TODOS_LIST} li
${TODO_COMPLETE_TOGGLE} =     css:.toggle


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

    @{createdNames} =    Create List
    @{allTodos} =      Get WebElements     ${TODO_ITEM}
    FOR    ${todo}    IN     @{allTodos}
        ${todoName} =    Get Text     ${todo}
        Append To List    ${createdNames}     ${todoName}
    END
    Lists Should Be Equal     ${createdNames}     ${expectedNames}    ignore_order=True
    

Check if todo in NOT visible on the list
    [Arguments]    ${name}
    Element Text Should Not Be     ${TODOS_LIST}     ${name}
 
Mark todo as completed
    Select Checkbox     ${TODO_COMPLETE_TOGGLE}

Check if todo is marked as completed
    Element Attribute Value Should Be     ${TODO_ITEM}     class     completed
