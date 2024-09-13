*** Settings ***
Library   SeleniumLibrary


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