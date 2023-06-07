*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_COMPLETE_TOGGLE} =     css:.todo-list .toggle
${TODO_ITEM} =                css:.todo-list li
${TODO_DELETE_BUTTON} =    css:.todo-list .destroy

*** Keywords ***
Complete todo
    Select Checkbox    ${TODO_COMPLETE_TOGGLE}

Verify if todo has class completed
    ${classes} =    Get Element Attribute    ${TODO_ITEM}    class
    Should Contain    ${classes}    completed
    # Element Attribute Value Should Be    ${TODO_ITEM}    class   completed

Verify todo is on the list
    [Arguments]   ${todoName}
    Element Text Should Be     ${TODOS_LIST}    ${todoName}

# Verify list contains a todo
#     [Arguments]   ${todoName}
#     Element Should Contain     ${TODOS_LIST}    ${todoName}


Verify todo is not on the list
    [Arguments]   ${todoName}
    Element Text Should Not Be     ${TODOS_LIST}    ${todoName}

# Verify list contains exact number of todos
#      [Arguments]   ${expectedCount}
#      @{createdTodos} =   Get WebElements    ${TODO_ITEM}
#      ${createtTododsCount} =    Get Length   ${createdTodos}
#      Should Be Equal As Integers    ${createtTododsCount}    ${expectedCount}

Verify if all todos are created
    [Arguments]    @{expectedTodos}
    @{createdTodos} =   Get WebElements    ${TODO_ITEM}
    @{existingTodoNames} =   Create List
    FOR   ${todo}  IN    @{createdTodos}
        ${todoName} =    Get Text    ${todo}
        Append To List    ${existingTodoNames}    ${todoName}
    END
    Lists Should Be Equal    ${expectedTodos}    ${existingTodoNames}   ignore_order=True

Delete todo
    Mouse Over    ${TODO_ITEM}
    Click Element   ${TODO_DELETE_BUTTON}