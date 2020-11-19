*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Open todoMVC application
    Open browser      ${TODOMVC_URL}    ${BROWSER}