*** Settings ***
Library  SeleniumLibrary
Library  Dialogs

Test Setup  Load page
Test Teardown  Close page

*** Variables ***
${DROP_DOWN_1} =  css:#dropdowm-menu-1


*** Test Cases ***
Selecting options drop down menu
    Sleep  2s
    Select From List By Index  ${DROP_DOWN_1}  2
    Sleep  2s
    Select From List By Label  css:#dropdowm-menu-2  JUnit
    Sleep  2s
    Select From List By Value  css:#dropdowm-menu-3  css
    Sleep  2s

Get selected menu option
    ${selected_menu} =  Get Selected List Label  ${DROP_DOWN_1}
    log  ${selected_menu}

List available options
    ${items} =  Get List Items  ${DROP_DOWN_1}
    log  ${items}

Iterate through all options in menu
    Sleep  2
    @{items} =  Get List Items  ${DROP_DOWN_1}


*** Keywords ***
Load page
    Open Browser  http://webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html  firefox
    Wait Until Element Is Visible  css:#main-header

Close page
    Close Browser