*** Variables ***
${TODO_INPUT} =    css:.new-todo


*** Keywords ***
Create new todo
    Input text    ${TODO_INPUT}     ${TODO_NAME}
    Press keys    ${TODO_INPUT}    RETURN