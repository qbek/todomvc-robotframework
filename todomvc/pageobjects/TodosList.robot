*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO_COMPLETE_TOGGLE} =     css:.todo-list .toggle
${TODO_ITEM} =                css:.todo-list li
${TODO_DELETE_BUTTON} =    css:.todo-list .destroy

${TODO_ITEM_BY_INDEX} =    ${TODO_ITEM}:nth-child(<INDEX>)
${TODO_DELETE_BUTTON_BY_INDEX} =   ${TODO_ITEM_BY_INDEX} .destroy

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
    @{existingTodoNames} =   Collect all todos form list
    Lists Should Be Equal    ${expectedTodos}    ${existingTodoNames}   ignore_order=True

Collect all todos form list
    @{createdTodos} =   Get WebElements    ${TODO_ITEM}
    @{existingTodoNames} =   Create List
    FOR   ${todo}  IN    @{createdTodos}
        ${todoName} =    Get Text    ${todo}
        Append To List    ${existingTodoNames}    ${todoName}
    END
    Return From Keyword    ${existingTodoNames}

# Delete todo
#     Mouse Over    ${TODO_ITEM}
#     Click Element   ${TODO_DELETE_BUTTON}

Delete todo
    [Arguments]    ${todoNameToDelete}
    ${index} =   Find todo index by name   ${todoNameToDelete}
    
    # delete tod
    ${indexStr} =    Convert to string    ${index}
    ${todoItem} =   Replace String    ${TODO_ITEM_BY_INDEX}    <INDEX>     ${indexStr}
    Mouse Over   ${todoItem}

    ${deleteButton} =   Replace String   ${TODO_DELETE_BUTTON_BY_INDEX}   <INDEX>    ${indexStr}
    Click Element   ${deleteButton}

Find todo index by name
    [Arguments]   ${todoNameToDelete}
    # Find index of todo by name
    @{allCreatedTodos} =   Collect all todos form list
    ${index} =    Get Index From List    ${allCreatedTodos}    ${todoNameToDelete}
    ${index} =    Evaluate   ${index} + 1
    Return From Keyword    ${index}
