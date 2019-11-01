*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${todo-counter} =  css:.todo-count strong

*** Keywords ***
Get todos counter
    ${count} =    Get Text   ${todo-counter}
    Return From Keyword    ${count}