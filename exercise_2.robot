*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
User can mix colors
    Open Browser    https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox
    Select Checkbox    css:[name="red"]
    Select Checkbox    css:[name="blue"]
    Element Attribute Value Should Be    css:#light    data-color    \#FF00FF
    Close Browser

User can enable text element
    Open Browser    https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox
    # Select Checkbox    css:#switch
    Click Element    css:.custom-control-label
    Element Should Be Enabled    css:#text
    Close Browser
