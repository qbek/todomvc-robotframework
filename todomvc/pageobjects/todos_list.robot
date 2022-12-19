*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =         css:.todo-list li
${TODO_COMPLETE_TOGGLE} =    css:.toggle
${TODO_DELETE} =     css:.destroy

${TODO_BY_INDEX} =   ${TODO}:nth-child(<INDEX>)
${TODO_DELETE_BY_INDEX} =      ${TODO}:nth-child(<INDEX>) .destroy

*** Keywords ***
Check if todo is listed
    [Arguments]    ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

Check if todo is NOT listed
    [Arguments]    ${name}
    Element Should Not Contain    ${TODOS_LIST}    ${name}

Check if all todos are listed
    [Arguments]    @{names}
    # FOR    ${name}    IN    @{names}
    #     Element Should Contain    ${TODOS_LIST}    ${name}
    # END
    # @{allTodos} =    Get WebElements    ${TODO}
    # ${todoCount} =    Get Length    ${allTodos}
    # ${expectedTodoCount} =    Get Length    ${names}
    # Should Be Equal As Integers    ${todoCount}    ${expectedTodoCount}
    
    @{actualNames} =    Create List
    @{allTodos} =    Get WebElements    ${TODO}
    FOR   ${todo}   IN   @{allTodos}
        ${text} =    Get Text     ${todo}
        Append To List    ${actualNames}    ${text}
    END 
    Lists Should Be Equal    ${actualNames}    ${names}

Complete todo
    Select Checkbox    ${TODO_COMPLETE_TOGGLE}

Check if todo completed
    Element Attribute Value Should Be    ${TODO}    class    completed

Delete todo
    Mouse Over    ${TODO}
    Click element     ${TODO_DELETE}

Delete todo THE ONE
    # Mouse Over    ${TODO}:nth-child(3)
    # Click element     ${TODO}:nth-child(3) .destroy

    ${todoIndex} =   Find todo index by name    THE ONE
    Log     Todo with name THE ONE has index: ${todoIndex}    console=True

    ${index_str} =    Convert To String    ${todoIndex}
    ${todoByIndex} =    Replace String    ${TODO_BY_INDEX}    <INDEX>     ${index_str}
    ${todoDeleteByIndex} =    Replace String    ${TODO_DELETE_BY_INDEX}    <INDEX>     ${index_str}

    Mouse Over    ${todoByIndex}
    Click Element    ${todoDeleteByIndex}


Find todo index by name
    [Arguments]    ${name}
    @{allTodos} =    Get WebElements    ${TODO}
    ${index} =   Set Variable   ${1}
    FOR     ${todo}      IN    @{allTodos}
        ${currentTodoName} =    Get Text    ${todo}
        Log      ${index} - ${currentTodoName}    console=True
        Return From Keyword If    '${currentTodoName}' == '${name}'     ${index}
        ${index} =    Evaluate    ${index} + 1
    END