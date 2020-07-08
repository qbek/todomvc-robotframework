*** Settings ***
Library    SeleniumLibrary
Resource   New_todo_input.robot

*** Keywords ***
Open todoMVC application
    Open browser    ${TODOMVC_URL}    ${BROWSER}
    Set Tags    ${BROWSER}
    New todo input is displayed
    Capture page screenshot
