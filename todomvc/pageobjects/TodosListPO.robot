*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODOS_LIST} =    css:#todo-list
${TODO} =         css:#todo-list li
${TODO_COMPLETE_TOGGLE} =    css:.toggle


*** Keywords ***
Check if todo is on the list
    [Arguments]   ${name}
    Element Text Should Be    ${TODOS_LIST}    ${name}

Check if todo is NOT on the list
    [Arguments]   ${name}
    Element Should Not Contain    ${TODOS_LIST}    ${name}


Check if todo is marked as completed
    Element Attribute Value Should Be    ${TODO}    class    \ completed


Complete todo
    Select Checkbox     ${TODO_COMPLETE_TOGGLE}

  