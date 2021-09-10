*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Start todomvc app
    Open browser    ${TODOMVC_URL}    ${BROWSER}
#    Open browser    ${TODOMVC_URL}    ${BROWSER}   remote_url=http://127.0.0.1:4444/wd/hub   desired_capabilities=name:${TEST_NAME}
    Maximize browser window

Stop todomvc app
    Close browser


