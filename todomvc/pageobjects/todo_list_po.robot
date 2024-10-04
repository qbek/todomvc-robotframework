*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${TODOS_LIST} =    css:#todo-list
${TODO_ITEM} =    ${TODOS_LIST} li 
${TODO_COMPLETE_TOGGLE} =     ${TODO_ITEM} .toggle
${TODO_DELETE_BUTTON} =   ${TODO_ITEM} .destroy

*** Keywords ***
Todo is only the list
    [Arguments]    ${name}
    Element Text Should Be     ${TODOS_LIST}    ${name}

List contains todo
    [Arguments]    ${name}
    Element Should Contain    ${TODOS_LIST}    ${name}


List contains all todos
    [Arguments]    @{expected}
    @{existing} =    Create List
    @{existing_todo_items} =    Get WebElements    ${TODO_ITEM}
    FOR  ${todo_item}  IN  @{existing_todo_items}
        ${text} =    Get Text    ${todo_item}
        Log To Console     ${text}
        Append To List    ${existing}    ${text}
    END
    Lists Should Be Equal      ${existing}    ${expected}     ignore_order=True
    

Todo is NOT on the list
    [Arguments]    ${name}
    Element Text Should Not Be     ${TODOS_LIST}     ${name}

Mark todo as completed
    Select Checkbox     ${TODO_COMPLETE_TOGGLE} 

Todo is marked as completed
    Element Attribute Value Should Be     ${TODO_ITEM}    class     \ completed

Move mouse over todo
    Mouse Over    ${TODO_ITEM}

Delete todo
    Click Element    ${TODO_DELETE_BUTTON}