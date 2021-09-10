*** Settings ***
Library    SeleniumLibrary
Test Setup    Open exercise 2 page
Test Teardown    Close exercise page

*** Variables ***
${EXERCISE2_URL} =    https://qbek.github.io/selenium-exercises/pl/check_boxes.html
${BROWSER} =     firefox

${RED_LIGHT_ON} =     css:[name="red"]
${BLUE_LIGHT_ON} =     css:[name="blue"]

${LIGHT_ELEMENT} =    css:#light
${LIGHT_COLOR_PINK} =    \#FF00FF


*** Test Cases ***
Light color test
    Select checkbox     ${RED_LIGHT_ON}
    Select checkbox     ${BLUE_LIGHT_ON}
    Element attribute value should be     ${LIGHT_ELEMENT}     data-color     ${LIGHT_COLOR_PINK}

Comments enabling test
    Element should be disabled   css:#text
    Click element     css:.custom-control-label
    Element should be enabled   css:#text

*** Keywords ***
Open exercise 2 page
    Open browser    ${EXERCISE2_URL}    ${BROWSER}
    Maximize browser window

Close exercise page
    Sleep     1s
    Close browser
