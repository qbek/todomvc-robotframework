*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
Check if all needed drop downs are there
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    chrome
    Sleep    2s
    Page Should Contain List    css:#dropdowm-menu-1
    Page Should Not Contain List    css:[value="blue"]
    Close Browser


Selecting options
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    chrome
    Sleep    2s
    Select From List By Index    css:#dropdowm-menu-1    2
    Sleep    2s
    Select From List By Label    css:#dropdowm-menu-2    Eclipse
    Sleep    2s
    Select From List By Label    css:#dropdowm-menu-2    Maven
    Sleep    2s
    Select From List By Value    css:#dropdowm-menu-3    javascript
    Sleep    2s

    Close Browser


Listening menu options
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    chrome
    Sleep    2s
    ${label} =    Get Selected List Label    css:#dropdowm-menu-2
    Log    ${label}
    ${allLabels} =    Get List Items    css:#dropdowm-menu-3
    Log    ${allLabels}     console=True
    Close Browser


Click all menu items
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    chrome
    Sleep    2s
    @{allLabels} =    Get List Items    css:#dropdowm-menu-3

    FOR    ${label}    IN   @{allLabels}
        Select From List By Label     css:#dropdowm-menu-3    ${label}
        Sleep   1s
    END


    Close Browser