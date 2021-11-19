*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${TODO_LIST} =    css:.todo-list
${TODO_ELEMENT} =   ${TODO_LIST} li
${TODO_COMPLETE_CHECKBOX} =    ${TODO_ELEMENT} .toggle

${TODO_ELEMENT_BY_INDEX} =    ${TODO_ELEMENT}:nth-child(<INDEX>)
${TODO_DELETE_BUTTON_BY_INDEX} =    ${TODO_ELEMENT_BY_INDEX} .destroy

*** Keywords ***
Check if todo is on the list
    [Arguments]   ${name}
    Element text should be     ${TODO_ELEMENT}     ${name}
    Capture page screenshot

Check if todo is NOT on the list
    [Arguments]   ${name}
    Element Should Not Contain     ${TODO_LIST}    ${name}
    Capture page screenshot

Check if todo is completed
    ${classes} =     Get element attribute     ${TODO_ELEMENT}     class
    Should contain     ${classes}    completed
    Capture page screenshot

Complete todo
    Select checkbox   ${TODO_COMPLETE_CHECKBOX}
    Capture page screenshot

Delete todo
    [Arguments]     ${name}
    ${index} =    Find todo index by name     ${name}
    Log    Szukany todo ma index: ${index}    console=True
    ${id_str} =    Convert to string    ${index}
    ${mo_selector} =    Replace string   ${TODO_ELEMENT_BY_INDEX}    <INDEX>    ${id_str}
    ${delete_selector} =    Replace string   ${TODO_DELETE_BUTTON_BY_INDEX}    <INDEX>    ${id_str}

    Mouse over     ${mo_selector}
    Click element   ${delete_selector}

Get count of todos on the list
    ${count} =    Get element count    ${TODO_ELEMENT}
    Return from keyword    ${count}

Find todo index by name
    [Arguments]    ${name}
    ${index} =     Set variable    ${1}
    @{todos} =     Get WebElements    ${TODO_ELEMENT}
    FOR   ${todo}    IN    @{todos}
        ${currentTodoName} =     Get text   ${todo}
        Log    ${index} - ${currentTodoName}    console=True
        Return from keyword if     '${currentTodoName}' == '${name}'     ${index}
        ${index} =     Evaluate    ${index} + 1
    END