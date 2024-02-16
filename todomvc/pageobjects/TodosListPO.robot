*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${TODOS_LIST} =    css:#todo-list
${TODO} =         css:#todo-list li
${TODO_COMPLETE_TOGGLE} =    css:.toggle
${TODO_DELETE_BUTTON} =     css:.destroy

${TODO_BY_INDEX} =    css:#todo-list li:nth-child(<INDEX>)
${TODO_DELETE_BUTTON_BY_INDEX} =     css:#todo-list li:nth-child(<INDEX>) .destroy


*** Keywords ***
Check if todo is on the list
    [Arguments]   ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

Check if one of todos is on the list
    [Arguments]   ${name}
    Element Should Contain    ${TODOS_LIST}    ${name}


Check if all todos are on the list
    [Arguments]   @{expectedTodos}

    @{todosFromApp} =     Get list of all displayed todos
    Lists Should Be Equal     ${todosFromApp}     ${expectedTodos}   ignore_order=True

Get list of all displayed todos
    @{todosFromApp} =     Create List
    @{todos} =   Get WebElements     ${TODO}
    FOR    ${todo}    IN    @{todos}
        ${name} =    Get Text     ${todo}
        Append To List    ${todosFromApp}    ${name}
    END
    Return From Keyword     @{todosFromApp}


Check if todo is NOT on the list
    [Arguments]   ${name}
    Element Should Not Contain    ${TODOS_LIST}    ${name}


Check if todo is marked as completed
    Element Attribute Value Should Be    ${TODO}    class    \ completed


Complete todo
    Select Checkbox     ${TODO_COMPLETE_TOGGLE}

Delete todo
    [Arguments]   ${name}
    ${index} =    Find todo index by name    ${name}
    Log     Delete todo with index: ${index}    console=True
    ${index_str} =    Convert To String   ${index}
    ${todo} =    Replace String    ${TODO_BY_INDEX}    <INDEX>    ${index_str}
    ${delete} =   Replace String    ${TODO_DELETE_BUTTON_BY_INDEX}    <INDEX>    ${index_str}  

    Mouse Over    ${todo}
    Click Element    ${delete}

Find todo index by name
    [Arguments]   ${name}
    @{allTodos} =   Get list of all displayed todos 
    ${index} =    Get Index From List   ${allTodos}    ${name}
    ${index} =    Evaluate   ${index} + 1
    Return From Keyword   ${index}
    