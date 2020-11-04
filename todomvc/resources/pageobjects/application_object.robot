*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open application
    Open browser     ${TODOMVC_URL}    ${BROWSER}     #remote_url=http://localhost:4444/wd/hub     desired_capabilities=name:${TEST NAME}
    Maximize browser window