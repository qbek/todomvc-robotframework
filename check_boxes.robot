*** Settings ***
Library    SeleniumLibrary
Test Setup   Open page
Test Teardown    Close browser

*** Variables ***
${PAGE_URL} =     https://qbek.github.io/selenium-exercises/check_boxes.html
${BROWSER} =     firefox

${RED_LIGHT} =    css:[name="red"]
${BLUE_LIGHT} =    css:[name="blue"]
${LIGHT_BOX} =    css:#light
${PINK_COLOR} =    \#FF00FF
${SLEEP_TIME} =   2s

${COMMENT_TEXTFIELD} =    css:#text
${COMMENT_ENABLE_BUTTON} =     css:.custom-control-label

*** Test Cases ***
Light color test
#    Select checkbox    ${RED_LIGHT}
#    Select checkbox    ${RED_LIGHT}
    Select checkbox    ${BLUE_LIGHT}
  #  Click element    css:[name="red"]
  #  Click element    css:[name="red"]
  #  Click element    css:[name="blue"]
    Element attribute value should be    ${LIGHT_BOX}    data-color    ${PINK_COLOR}
    Sleep     ${SLEEP_TIME}

Enabling comment text box
    Element Should Be Disabled   ${COMMENT_TEXTFIELD}
    Click element    ${COMMENT_ENABLE_BUTTON}
    Element should be enabled    ${COMMENT_TEXTFIELD}
    Sleep     ${SLEEP_TIME}

*** Keywords ***
Open page
    Open browser    ${PAGE_URL}    ${BROWSER}
    Maximize browser window