*** Settings ***
Library    SeleniumLibrary

Test Setup    Start application
Test Teardown    Close application

*** Variables ***
${PAGE_URL} =    http://www.webdriveruniversity.com/Login-Portal/index.html
${BROWSER} =    firefox
${SLEEP_TIME} =    2s
${LOGIN_INPUT} =    css:#text
${LOGIN_BUTTON} =    css:#login-button
${PASSWORD_INPUT} =   css:#password

${login} =    mojLogin
${password} =   topSecret


*** Test Cases ***
Login form is correct
    Page Should Contain Element    ${LOGIN_INPUT}
    Page Should Contain Element    ${PASSWORD_INPUT}

User can enter data into input field
    Input Text    ${LOGIN_INPUT}    ${login}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Textfield Should Contain    ${LOGIN_INPUT}   ${login}
    Textfield Value Should Be   ${PASSWORD_INPUT}    fjasdkfgjalskdfj
    Click Element     ${LOGIN_BUTTON}


*** Keywords ***
Start application
    Open Browser    ${PAGE_URL}    ${BROWSER}
    Wait Until Page Contains Element    ${LOGIN_INPUT}


Close application
    Close Browser

