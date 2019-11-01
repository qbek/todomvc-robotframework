*** Settings ***
Library  SeleniumLibrary
Library  Dialogs
Library  Screenshot

*** Variables ***
#environment configuration
${PAGE_URL} =  http://webdriveruniversity.com/Login-Portal/index.html

*** Test Cases ***
Test scenario with user manual validation
    Open Browser  ${PAGE_URL}  firefox
    ${status} =    Run Keyword And Return Status   Execute Manual Step    Czy pojawiły się wszystkie inputy
    Run Keyword Unless    ${status}   Take Screenshot And Fail
    Close Browser


*** Keywords ***
Take Screenshot And Fail
    Take Screenshot
    Fail