*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${TODOS_LIST} =    css:#todo-list
${TODO} =         css:#todo-list li
${TODO_COMPLETE_TOGGLE} =    css:.toggle
${TODO_DELETE_BUTTON} =     css:.destroy


*** Keywords ***
Check if todo is on the list
    [Arguments]   ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

Check if one of todos is on the list
    [Arguments]   ${name}
    Element Should Contain    ${TODOS_LIST}    ${name}


Check if all todos are on the list
    [Arguments]   @{expectedTodos}

    @{todosFromApp} =     Create List
    @{todos} =   Get WebElements     ${TODO}
    FOR    ${todo}    IN    @{todos}
        ${name} =    Get Text     ${todo}
        Append To List    ${todosFromApp}    ${name}
    END
    Lists Should Be Equal     ${todosFromApp}     ${expectedTodos}   ignore_order=True



Check if todo is NOT on the list
    [Arguments]   ${name}
    Element Should Not Contain    ${TODOS_LIST}    ${name}


Check if todo is marked as completed
    Element Attribute Value Should Be    ${TODO}    class    \ completed


Complete todo
    Select Checkbox     ${TODO_COMPLETE_TOGGLE}


Delete todo
    Mouse Over    ${TODO}
    Click Element      ${TODO_DELETE_BUTTON}