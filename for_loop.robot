*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${SELECT_LANGUAGE} =    css:#dropdowm-menu-1

*** Test Cases ***
Lop through select options
    Open browser    http://webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    firefox
    @{languages} =   Get List Items    ${SELECT_LANGUAGE}
    FOR    ${language}    IN    @{languages}
        Select From List By Label    ${SELECT_LANGUAGE}    ${language}
        Sleep   4s
    END

    Close browser