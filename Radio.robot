*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Check if all needed radio buttons are there
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    firefox
    Sleep    2s
    Page Should Contain Radio Button    css:[value="blue"]
    Page Should Not Contain Radio Button    css:[value="czerwony"]
    Close Browser


Change radio button selection
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    firefox
    Sleep    2s
    Radio Button Should Not Be Selected     color
    Select Radio Button   color    yellow
    Sleep    2s
    Radio Button Should Be Set To    color    yellow

    Close Browser