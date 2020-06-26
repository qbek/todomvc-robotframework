*** Settings ***
Library    SeleniumLibrary
Resource   New_todo_input.robot

*** Keywords ***
Open todoMVC application
    Open browser    ${TODOMVC_URL}    ${BROWSER}    remote_url=http://127.0.0.1:4444/wd/hub    desired_capabilities=name:${TEST NAME},build:${BUILD_ID}
    New todo input is displayed
    Capture page screenshot
