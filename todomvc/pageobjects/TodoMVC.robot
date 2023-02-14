*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${TODOMVC_URL} =    https://todomvc.com/examples/jquery/#/all
${BROWSER} =     firefox


*** Keywords ***
Open TodoMVC app
    Open Browser    ${TODOMVC_URL}      ${BROWSER}

Close TodoMVC app
    Close Browser