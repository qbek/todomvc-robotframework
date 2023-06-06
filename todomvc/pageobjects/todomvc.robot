*** Settings ***
Library    SeleniumLibrary
Resource   ../data/env_${ENV}.robot


*** Keywords ***
Open TodoMVC app
    Open Browser     ${TODOMVC_URL}    ${BROWSER}




