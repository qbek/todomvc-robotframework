*** Settings ***
Library     SeleniumLibrary
Resource    ../data/Env${ENV}.robot


*** Keywords ***
Open TodoMVC app
    Open Browser    ${TODOMVC_URL}      ${BROWSER}

Close TodoMVC app
    Close Browser