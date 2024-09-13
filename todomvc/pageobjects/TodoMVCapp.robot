*** Settings ***
Library    SeleniumLibrary
Resource   ../data/env_${ENV}.robot

*** Keywords ***
Start TodoMVC app
    Open Browser    ${TODOMVC_URL}    ${BROWSER}