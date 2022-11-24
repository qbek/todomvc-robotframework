*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all

*** Keywords ***
Open TodoMVC app
    Open Browser    ${TODOMVC_URL}    firefox

Close TodoMVC app
    Close Browser
