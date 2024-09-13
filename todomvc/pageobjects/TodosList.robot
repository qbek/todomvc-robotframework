*** Settings ***
Library   SeleniumLibrary
Library   Collections

*** Variables ***
${TODOS_LIST} =    css:#todo-list
${TODO_ITEM} =    css:#todo-list li 
${TODO_COMPLETE_TOGGLE} =     css:.toggle
${DELETE_BUTTON} =    css:.destroy

*** Keywords ***
Only todo exists on the list
    [Arguments]   ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

Todo exists on the list
    [Arguments]   ${name}
    Element Should Contain    ${TODOS_LIST}    ${name}

All todos exists on the list
    [Arguments]   @{expected}
    @{existing} =     Get all existing todos
    Lists Should Be Equal     ${existing}     ${expected}     ignore_order=True

Get all existing todos
    @{names} =   Create List    
    @{todos} =    Get WebElements    ${TODO_ITEM}
    FOR    ${todo}     IN      @{todos}
        ${text} =    Get Text   ${todo}
        Append To List     ${names}    ${text}
    END
    Return From Keyword    @{names}


Select todo complete checkbox
    Select Checkbox     ${TODO_COMPLETE_TOGGLE} 

Check todo has completed class
    Element Attribute Value Should Be     ${TODO_ITEM}    class     \ completed

Todo is not on the list
    [Arguments]  ${name}
    Element Text Should Not Be     ${TODOS_LIST}     ${name}

Hover todo item
    Mouse Over    ${TODO_ITEM}    
    
Click delete button
    Click Element    ${DELETE_BUTTON}