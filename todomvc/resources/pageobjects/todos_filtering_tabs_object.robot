*** Settings ***
Library    SeleniumWrapper.py

*** Variables ***
${ACTIVE_TAB} =    css:[href="#/active"]
${COMPLETED_TAB} =    css:[href="#/completed"]
${TODO_COUNTER} =   css:.todo-count

*** Keywords ***
Switch to Active tab
    Click element    ${ACTIVE_TAB}
    Capture page screenshot

Switch to Completed tab
    Click element    ${COMPLETED_TAB}
    Capture page screenshot


Todo counter shows
    [Arguments]     ${count}
    Element Text Should Be     ${TODO_COUNTER}     ${count} items left
    Capture page screenshot
