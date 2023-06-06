*** Settings ***
Library    SeleniumLibrary
Test Setup   Open Browser   ${EXERCISE_URL}      ${BROWSER}
Test Teardown   Close Browser


*** Variables ***
${EXERCISE_URL} =   https://qbek.github.io/selenium-exercises/pl/check_boxes.html
${BROWSER} =    chrome

${RED_COLOR} =    css:[name="red"]
${BLUE_COLOR} =    css:[name="blue"]

${MIXING_COLOR_ELEMENT} =    css:#light
${PINK} =    \#FF00FF


*** Test Cases ***
User can mix colors
    Select Checkbox   ${RED_COLOR}
    Select Checkbox    ${BLUE_COLOR}
    Element Attribute Value Should Be     ${MIXING_COLOR_ELEMENT}     data-color    ${PINK}
    

User can enable text field
    Element Should Be Disabled   css:#text
    Click Element    css:[for="switch"]
    Element Should Be Enabled    css:#text
    Log    nie jestem wykonany    console=True
   