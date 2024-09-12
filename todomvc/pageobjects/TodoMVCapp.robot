*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER} =   firefox
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/dist/#/all

*** Keywords ***
Start TodoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}