*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Check if all needed checkboxes are there
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    firefox
    Page Should Contain Checkbox    css:[value="option-1"]
    Page Should Contain Element    css:[value="option-2"]
    Close Browser


Checking and unchecking
    Set Selenium Speed    2s
    Open Browser    http://www.webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    firefox

    Checkbox Should Be Selected    css:[value="option-3"]
    Checkbox Should Not Be Selected     css:[value="option-2"]

    Unselect checkbox    css:[value="option-3"]
    Checkbox Should Not Be Selected    css:[value="option-3"]


    Select checkbox   css:[value="option-2"]
    Checkbox Should Be Selected    css:[value="option-2"]


    Unselect checkbox    css:[value="option-4"]
    Unselect checkbox    css:[value="option-4"]
    Unselect checkbox    css:[value="option-4"]

    Checkbox Should Not Be Selected    css:[value="option-4"]

    Click Element   css:[value="option-4"]

    Click Element   css:[value="option-4"]
    Checkbox Should Not Be Selected    css:[value="option-4"]

    Close Browser