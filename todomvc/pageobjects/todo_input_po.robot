*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${NEW_TODO_INPUT} =    css:#new-todo


*** Keywords ***
Wait until todo input is visible
    Wait Until Element Is Visible    ${NEW_TODO_INPUT}

Enter todo name
    [Arguments]   ${name} 
    Input Text    ${NEW_TODO_INPUT}    ${name}

Submit todo by pressing Enter
    Press Keys    ${NEW_TODO_INPUT}    RETURN


