*** Settings ***
Library    SeleniumLibrary
Test Setup   Open exercise page
Test Teardown   End test


*** Variables ***
${PAGE_URL} =   https://qbek.github.io/selenium-exercises/pl/check_boxes.html
${BROWSER} =    firefox

${BLUE} =    css:[name="blue"]
${RED} =    css:[name="red"]
${LIGHT} =    css:#light
${TEXT_AREA_ELEMENT} =    css:#text
${ENABLE_SWITCH} =     css:.custom-control-label

${PINK} =     \#FF00FF


*** Test Cases ***
User can mix colors
    Select checkbox    ${BLUE}
    Select checkbox    ${RED}
    Element attribute value should be    ${LIGHT}     data-color     ${PINK}

User can enable text area
    Element should be disabled    ${TEXT_AREA_ELEMENT}
    Click element    ${ENABLE_SWITCH}
    Element should be enabled     ${TEXT_AREA_ELEMENT}

*** Keywords ***
Open exercise page
    Open browser      ${PAGE_URL}    ${BROWSER}

End test
    Sleep   1s
    Close browser