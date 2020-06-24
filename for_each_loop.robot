*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***

Click all menu items
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    chrome
    @{allLabels} =    Get List Items    css:#dropdowm-menu-3

    FOR    ${label}    IN   @{allLabels}
        Select From List By Label     css:#dropdowm-menu-3    ${label}
        Sleep   1s
    END



    Close Browser