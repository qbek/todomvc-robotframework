*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${TODOS_LIST} =    css:#todo-list
${TODO_ITEM} =    css:#todo-list li 
${TODO_COMPLETE_TOGGLE} =     css:.toggle


*** Keywords ***
Todo exists on the list
    [Arguments]   ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

Select todo complete checkbox
    Select Checkbox     ${TODO_COMPLETE_TOGGLE} 

Check todo has completed class
    Element Attribute Value Should Be     ${TODO_ITEM}    class     \ completed

Todo is not on the list
    [Arguments]  ${name}
    Element Text Should Not Be     ${TODOS_LIST}     ${name}