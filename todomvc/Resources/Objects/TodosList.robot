*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${todo-list} =    css:.todo-list
${todo-list-items} =    css:.todo-list li
${todo-list-items-text} =     css:.todo-list li label
${todo-list-item-delete-button} =   css:.todo-list li:nth-child(<ID>) button
${todo-list-item} =   css:.todo-list li:nth-child(<ID>)

*** Keywords ***


Todo list is empty
    # if there are no todos on the list
    # page should not contain any todo item element
    Page Should Not Contain Element    ${todo-list-items}
    Capture Page Screenshot

Todo list contains todo
    [Arguments]  ${expected}
    Element Should Contain  ${todo-list}  ${expected}
    Capture Page Screenshot

Todo list contains all todos
    [Arguments]     @{expected-list}
    FOR   ${todo}   IN     @{expected-list}
        Todo list contains todo    ${todo}
    END

Todo list doesn't contain todo
    [Arguments]  ${todo}
    Element Should Not Contain  ${todo-list}  ${todo}
    Capture Page Screenshot

Get count of todos
    @{elements} =  Get Web Elements     ${todo-list-items}
    ${count} =   Get Length    ${elements}
    Return From Keyword    ${count}


Get Todo Index
    [Arguments]  ${todo}
    @{elements} =    Get Web Elements   ${todo-list-items-text}
    ${index} =    Set Variable    ${1}
    FOR    ${el}    IN    @{elements}
        ${text} =    Get Text   ${el}
        Return From Keyword If   '${text}' == '${todo}'    ${index}
        ${index} =    Evaluate    ${index}+1
    END

Delete Todo By Index
    [Arguments]  ${index}
    ${i} =    Convert To String    ${index}
    ${over} =   Replace String   ${todo-list-item}   <ID>    ${i}
    ${selector} =   Replace String   ${todo-list-item-delete-button}   <ID>    ${i}
    Mouse Over    ${over}
    Capture Page Screenshot
    Click Element     ${selector}
    Capture Page Screenshot
