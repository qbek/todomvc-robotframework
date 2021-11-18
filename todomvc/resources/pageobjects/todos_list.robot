*** Variables ***
${TODO_LIST} =    css:.todo-list
${TODO_ELEMENT} =   css:.todo-list li
${TODO_COMPLETE_CHECKBOX} =    css:.todo-list li .toggle

*** Keywords ***
Check if todo is on the list
    Element text should be     ${TODO_ELEMENT}     ${TODO_NAME}

Check if todo is NOT on the list
    Element Should Not Contain     ${TODO_LIST}    ${TODO_NAME}

Check if todo is completed
    Element attribute value should be     ${TODO_ELEMENT}     class     completed

Complete todo
    Select checkbox   ${TODO_COMPLETE_CHECKBOX}