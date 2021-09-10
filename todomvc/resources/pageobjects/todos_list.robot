*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_ITEM} =     ${TODOS_LIST} li
${TODO_ITEM_COMPLETE_TOGGLE} =     ${TODO_ITEM} .toggle

*** Keywords ***
Check if todo is visible
    [Arguments]     ${name}
    Element text should be    ${TODO_ITEM}    ${name}
    Capture page screenshot

Check if todo is on the list
    [Arguments]     ${name}
    Element should contain    ${TODOS_LIST}    ${name}
    Capture page screenshot

Check if todo is NOT visible
    [Arguments]      ${name}
    Element text should not be    ${TODOS_LIST}    ${name}
    Capture page screenshot

Check if todo is marked as completed
    Element Attribute Value Should Be      ${TODO_ITEM}      class      completed
    Capture page screenshot
    #Page Should Contain Element      css:.completed

Complete todo
    Click element    ${TODO_ITEM_COMPLETE_TOGGLE}

Get count of existing todos
    ${count} =     Get Element Count    ${TODO_ITEM}
    Return from keyword     ${count}