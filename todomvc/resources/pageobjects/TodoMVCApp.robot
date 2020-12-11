*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Open TodoMVC application
    Open Browser    ${TODOMVC_APP}    ${BROWSER} 
    Maximize Browser Window
