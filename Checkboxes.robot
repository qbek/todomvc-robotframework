*** Settings ***
Library    SeleniumLibrary

Test Setup    Open checkboxes exercise page
Test Teardown     Close page

*** Variables ***
${PAGE_URL} =    https://qbek.github.io/selenium-exercises/en/check_boxes.html
${BROWSER} =    firefox

${RED_COLOR} =   css:[name="red"]
${BLUE_COLOR} =   css:[name="blue"]

${LIGHT} =    css:#light
${PINK_COLOR} =   \#FF00FF

${COMMENT_AREA} =    css:#text
${ENABLE_COMMENT_SWITCH} =     css:.custom-control-label


*** Test Cases ***
User can mix colors
    Select checkbox    ${RED_COLOR}
    Select checkbox    ${BLUE_COLOR}
    Element attribute value should be     ${LIGHT}      data-color     ${PINK_COLOR}


User can enable comment area
    Element should be disabled    ${COMMENT_AREA}
    Click element     ${ENABLE_COMMENT_SWITCH}
    Element should be enabled     ${COMMENT_AREA}

*** Keywords ***
Open checkboxes exercise page
    Open browser    ${PAGE_URL}     ${BROWSER}
    Maximize browser window

Close page
    Sleep    2s
    Close browser