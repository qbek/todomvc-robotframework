*** Settings ***
Library  SeleniumLibrary


Test Setup  Load page
Test Teardown  Close page

*** Variables ***
#environment configuration
${PAGE_URL} =  http://webdriveruniversity.com/Login-Portal/index.html
${SLEEP_TIME} =  5s

#webelements
${LOGIN_INPUT} =  css:#text
${INVALID_INPUT} =  css:#text-not-exists
${PASSWORD_INPUT} =  css:#password

#testdata
${login} =  username
${password} =  password


*** Test Cases ***
Checking input fields existance
    Page Should Contain Textfield  ${LOGIN_INPUT}
    Page Should Contain Textfield  ${PASSWORD_INPUT}
    # example of failed verification
    Page Should Contain Textfield  ${INVALID_INPUT}  My own error msg

Entering text into input field
    Input Text  ${LOGIN_INPUT}  ${login}
    Input Password  ${PASSWORD_INPUT}  ${password}
    Sleep  ${SLEEP_TIME}
    Clear Element Text  ${LOGIN_INPUT}

Checking input field text
    Input Text  ${LOGIN_INPUT}  ${login}

    # verification based on exact match
    Textfield Value Should Be  ${LOGIN_INPUT}  username

    # verification based on contain expresion,
    # this step passes
    # as username contains user
    Textfield Should Contain  ${LOGIN_INPUT}  user

    # but this one fails
    Textfield Value Should Be  ${LOGIN_INPUT}  user

*** Keywords ***
Load page
    Open Browser  ${PAGE_URL}  firefox
    Wait Until Element Is Visible  ${LOGIN_INPUT}

Close page
    Close Browser