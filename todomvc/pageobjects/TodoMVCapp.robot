*** Settings ***
Library           SeleniumLibrary
Resource          ../testdata/env_${ENV}.robot

*** Keywords ***
Open TodoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}

Close TodoMVC app
    Close Browser
