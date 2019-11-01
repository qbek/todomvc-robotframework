*** Settings ***
Library  SeleniumLibrary
Library  String

Resource   TodosList.robot

*** Variables ***
${todo-list-item} =                           css:.todo-list li
${todo-list-item-text} =                      ${todo-list-item} label
${todo-list-item-index} =                     ${todo-list-item}:nth-child(<ID>)
${todo-list-item-delete-button} =             ${todo-list-item-index} button
${todo-list-item-complete-button} =           ${todo-list-item-index} input[type="checkbox"]


*** Keywords ***
Complete Todo
    [Arguments]   ${todo}
    ${index} =   Get Todo Index    ${todo}
    Complete Todo By Index    ${index}



Complete Todo By Index
    [Arguments]  ${index}
    ${selector} =   Get Selector   ${index}   ${todo-list-item-complete-button}
    Click Element     ${selector}
    Capture Page Screenshot

Todo should be completed
    [Arguments]  ${todo}
    ${index} =    Get Todo Index   ${todo}
    ${selector} =   Get Selector   ${index}   ${todo-list-item-index}
    ${classes} =   Get Element Attribute    ${selector}    class
    Should Contain   ${classes}    completed
    Capture Page Screenshot


Get Selector
    [Arguments]  ${index}   ${base-selector}
    ${i} =    Convert To String    ${index}
    ${selector} =   Replace String   ${base-selector}   <ID>    ${i}
    Return From Keyword    ${selector}