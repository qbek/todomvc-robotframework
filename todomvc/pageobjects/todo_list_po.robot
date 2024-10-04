*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${TODOS_LIST} =    css:#todo-list
${TODO_ITEM} =    ${TODOS_LIST} li 
${TODO_COMPLETE_TOGGLE} =     ${TODO_ITEM} .toggle

*** Keywords ***
Todo is on the list
    [Arguments]    ${name}
    Element Text Should Be     ${TODOS_LIST}    ${name}

Todo is NOT on the list
    [Arguments]    ${name}
    Element Text Should Not Be     ${TODOS_LIST}     ${name}

Mark todo as completed
    Select Checkbox     ${TODO_COMPLETE_TOGGLE} 

Todo is marked as completed
    Element Attribute Value Should Be     ${TODO_ITEM}    class     \ completed
