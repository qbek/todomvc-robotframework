*** Settings ***
Library    SeleniumLibrary
Resource   New_todo_input.robot

*** Keywords ***
Open todoMVC application
    Open browser    ${TODOMVC_URL}    ${BROWSER}
    New todo input is displayed
    Capture page screenshot