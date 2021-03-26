*** Settings ***
Library    SeleniumWrapper.py

*** Variables ***
${TODO_INPUT} =    css:.new-todo



*** Keywords ***
Create a todo by pressing ENTER
    Press keys    ${TODO_INPUT}    RETURN
#    Capture element screenshot     ${APPLICATION_VIEW}
    Capture page screenshot

Enter a todo name
    [Arguments]   ${name}
    Input text    ${TODO_INPUT}    ${name}
#    Capture element screenshot     ${APPLICATION_VIEW}
    Capture page screenshot

Wait for input todo element is ready
    Wait until page contains element    ${TODO_INPUT}
#    Capture element screenshot     ${APPLICATION_VIEW}
    Capture page screenshot
