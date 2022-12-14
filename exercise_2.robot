*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    ${mixing_color_page}    firefox
Test Teardown     Close Browser

*** Variables ***
${mixing_color_page} =    https://qbek.github.io/selenium-exercises/pl/check_boxes.html
${red_color} =    css:[name="red"]
${blue_color} =    css:[name="blue"]
${mixed_color} =    css:#light
${text} =         css:#text
${text_checkbox} =    css:.custom-control-label
${pink} =         \#FF00FF

*** Test Cases ***
User can mix colors
    Select Checkbox    ${red_color}
    Select Checkbox    ${blue_color}
    Element Attribute Value Should Be    ${mixed_color}    data-color    ${pink}

User can enable text field
    Element Should Be Disabled    ${text}
    Click Element    ${text_checkbox}
    Element Should Be Enabled    ${text}
