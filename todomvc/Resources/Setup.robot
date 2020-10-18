*** Settings ***
Library  SeleniumLibrary

Resource  Objects/TodoInputField.robot
Resource  ../Configuration/${ENV}.robot


*** Variables ***


*** Keywords ***
Open TodoMVC
    Add execution tags
    Start browser session
    Wait for todo input field

Add execution tags
    Set Tags    ${BROWSER}    ${BUILD_ID}

Start browser session
    ${CAPABILITIES} =   Set Variable    none
    ${CAPABILITIES} =   Run Keyword If   '${USE_SELENIUM_GRID}' != 'False'   Set Variable    name:${TEST NAME},build:${BUILD_ID}
    Open browser  ${TODOMVC_URL}    ${BROWSER}   remote_url=${URL_GRID}   desired_capabilities=${CAPABILITIES}

Close TodoMVC
    Close Browser
