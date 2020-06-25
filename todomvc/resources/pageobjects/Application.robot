*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${TODOMVC_URL} =    http://todomvc.com/examples/jquery/
${BROWSER} =    firefox

*** Keywords ***
Open todoMVC application
    Open browser    ${TODOMVC_URL}    ${BROWSER}