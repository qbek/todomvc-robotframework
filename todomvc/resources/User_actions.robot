*** Variables ***

${TODO_INPUT} =    css:.new-todo
${TODO_LIST} =    css:.todo-list
${TODO_ELEMENT} =   css:.todo-list li
${TODO_COMPLETE_CHECKBOX} =    css:.todo-list li .toggle
${ACTIVE_FILTER} =    css:.filters [href="#/active"]
${COMPLETED_FILTER} =    css:.filters [href="#/completed"]

${TODO_NAME} =    Nauczyć się RobotFramework


*** Keywords ***
User opens TodoMVC app
    Open browser      ${TODOMVC_URL}   ${BROWSER}

User adds a new todo
    Input text    ${TODO_INPUT}     ${TODO_NAME}
    Press keys    ${TODO_INPUT}    RETURN

User checks if todo was created
    Element text should be     ${TODO_ELEMENT}     ${TODO_NAME}

User completes the todo
    Select checkbox   ${TODO_COMPLETE_CHECKBOX}

User checks if todo is marked as completed
    Element attribute value should be     ${TODO_ELEMENT}     class     completed

User checks if completed todo is not on Active tab
    Click element    ${ACTIVE_FILTER}
    Element Should Not Contain     ${TODO_LIST}    ${TODO_NAME}

User checks if completed todo is on Completed tab
    Click element    ${COMPLETED_FILTER}
    Element text should be     ${TODO_ELEMENT}     ${TODO_NAME}
