*** Settings ***
Library    SeleniumLibrary
Test setup    Open exercise
Test Teardown    Close Browser

*** Variables ***
${EXERCISE_PAGE} =    https://qbek.github.io/selenium-exercises/pl/check_boxes.html
${BROWSER} =     firefox

${SELECT_RED} =   css:[name="red"]
${SELECT_BLUE} =    css:[name="blue"]

${LIGHTBOX} =   css:#light
${PINK_COLOR} =    \#FF00FF

${COMMENT_BOX_SWITCH} =    css:.custom-control-label
${COMMENT_BOX} =   css:#text

*** Test Cases ***
Check light color
    Select Checkbox    ${SELECT_RED}
    Select Checkbox    ${SELECT_BLUE}
    Element Attribute Value Should Be    ${LIGHTBOX}    data-color     ${PINK_COLOR}


Check element state
    Element Should Be Disabled    ${COMMENT_BOX}
    Click Element    ${COMMENT_BOX_SWITCH}
    Element Should Be Enabled    ${COMMENT_BOX}



*** Keywords ***
Open exercise
    Open Browser    ${EXERCISE_PAGE}    ${BROWSER}
    Maximize Browser Window
