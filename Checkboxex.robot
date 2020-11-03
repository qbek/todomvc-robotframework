*** Settings ***
Library    SeleniumLibrary

Test Setup      Load page
Test Teardown    Close browser

*** Variables ***
${PAGE} =     https://qbek.github.io/selenium-exercises/en/check_boxes.html
${BROWSER} =     firefox

${COLOR_RED} =     css:[name="red"]
${COLOR_BLUE} =     css:[name="blue"]
${LIGHT_ELEMENT} =    css:#light
${PINK_COLOR} =    \#FF00FF
${LIGHT_COLOR_ATTR} =    data-color

${COMMENT_ELEMENT} =    css:#text
${ENABLE_COMMENT_SWITCH} =     css:.custom-control-label

${SLEEP_TIME} =     2s


*** Test Cases ***
Color mixing form
    Select checkbox     ${COLOR_RED}
    Select checkbox     ${COLOR_BLUE}
    Element attribute value should be    ${LIGHT_ELEMENT}     ${LIGHT_COLOR_ATTR}     ${PINK_COLOR}
    Sleep    ${SLEEP_TIME}

Comments enable
    Element should be disabled     ${COMMENT_ELEMENT}
    Click element    ${ENABLE_COMMENT_SWITCH}
    Sleep    ${SLEEP_TIME}
    Element should be enabled     ${COMMENT_ELEMENT}

*** Keywords ***
Load page
    Open browser     ${PAGE}    ${BROWSER}
    Maximize browser window