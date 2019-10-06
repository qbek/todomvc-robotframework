*** Settings ***
Library  SeleniumLibrary

Test Setup  Load page
Test Teardown  Close page


*** Test Cases ***
Checking checkbox existance
    Page Should Contain Checkbox  css:#checkboxes input[value="option-1"]
    Page Should Contain Checkbox  css:input[value="green"]
    Page Should Not Contain Checkbox  css:#checkboxes input[value="not-exists"]  My own error: WHERE IS BLUE OPTION!!!
    Page Should Contain Checkbox  css:#checkboxes input[value="green"]  Green should be a checkbox

Selecting checkboxes
    Select Checkbox  css:#checkboxes input[value="option-1"]
    Sleep  2s
    Select Checkbox  css:#checkboxes input[value="option-2"]
    Sleep  2s
    Unselect Checkbox  css:#checkboxes input[value="option-3"]
    Sleep  2s


Checking checkbox state
    Checkbox Should Be Selected  css:#checkboxes input[value="option-3"]
    Checkbox Should Not Be Selected  css:#checkboxes input[value="option-2"]

*** Keywords ***
Load page
    Open Browser  http://webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html  firefox
    Wait Until Element Is Visible  css:#main-header

Close page
    Close Browser