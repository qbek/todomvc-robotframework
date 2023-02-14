*** Settings ***
Library    SeleniumLibrary
Test Setup     Open Browser     ${EXERCISE2_URL}    ${BROWSER}
Test Teardown    Close browser


*** Variables ***
${BROWSER} =    firefox
${EXERCISE2_URL} =     https://qbek.github.io/selenium-exercises/pl/check_boxes.html

${RED_COLOR} =    css:[name="red"]
${BLUE_COLOR} =   css:[name="blue"]
${MIXING_RESULT} =    css:#light
${TEXT_AREA} =    css:#text
${TEXT_AREA_ENABLE_TOGGLE} =     css:.custom-control-label

${PINK} =    \#FF00FF



*** Test Cases ***
User can mix colors
    Select Checkbox    ${RED_COLOR}
    Select Checkbox    ${BLUE_COLOR}
    Element Attribute Value Should Be     ${MIXING_RESULT}     data-color    ${PINK}
    

User can enable text area
    Element Should Be Disabled    ${TEXT_AREA}
    Click Element     ${TEXT_AREA_ENABLE_TOGGLE}
    Element Should Be Enabled     ${TEXT_AREA}
