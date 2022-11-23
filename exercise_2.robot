*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    ${URL}    firefox
Test Teardown     Close Browser

*** Variables ***
${URL} =          https://qbek.github.io/selenium-exercises/pl/check_boxes.html
${COLOR_RED} =    css:[name="red"]
${COLOR_BLUE} =    css:[name="blue"]
${COLOR_PINK} =    \#FF00FF
${MIXING_COLOR_RESULT} =    css:#light

*** Test Cases ***
User can mix colors
    Select Checkbox    ${COLOR_RED}
    Select Checkbox    ${COLOR_BLUE}
    Element Attribute Value Should Be    ${MIXING_COLOR_RESULT}    data-color    ${COLOR_PINK}

User can enable text element
    # Select Checkbox    css:#switch
    Click Element    css:.custom-control-label
    Element Should Be Enabled    css:text
    Alert Should Not Be Present
