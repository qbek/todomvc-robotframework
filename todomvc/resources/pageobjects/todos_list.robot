*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${TODOS_LIST} =    css:.todo-list
${TODO} =    ${TODOS_LIST} li
${COMPLETE_TODO} =   ${TODO} .toggle


*** Keywords ***
Complete a todo
    Click element    ${COMPLETE_TODO}

Todo is on the list
    Element should contain     ${TODOS_LIST}    Learn RobotFramework

Todo is not on the list
    Element should not contain     ${TODOS_LIST}    Learn RobotFramework

Todo is displayed as completed
    ${classes} =   Get Element Attribute    ${TODO}    class
    Should Contain   ${classes}    completed