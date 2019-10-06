*** Settings ***
Library  SeleniumLibrary

Test Setup  Load page
Test Teardown  Close page

*** Variables ***
${color_group} =  color
${password} =  css:#password


*** Test Cases ***
Checking radio button existance
    Page Should Contain Radio Button  css:input[value="green"]
    Page Should Contain Radio Button  css:input[value="blue"]  My own error: WHERE IS BLUE OPTION!!!
    Page Should Not Contain Radio Button  css:input[value="black"]
    Page Should Not Contain Radio Button  css:input[value="orange"]  My own error: ORANGE shouldn be there

Selecting options from radio button
    Select Radio Button  color  green
    Sleep  2s
    Select Radio Button  color  orange
    Sleep  2s
    Click Element  css:input[value="blue"]
    Sleep  2s

Checking radio button selection
    Radio Button Should Not Be Selected  color
    Select Radio Button  color  orange
    Radio Button Should Be Set To  color  orange
    Sleep  2s
    Radio Button Should Be Set To  color  blue

*** Keywords ***
Load page
    Open Browser  http://webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html  firefox
    Wait Until Element Is Visible  css:#main-header

Close page
    Close Browser