*** Settings ***
Library    SeleniumLibrary
Test Setup   Load page
Test Teardown   Finish test

*** Variables ***
${page_url} =    https://qbek.github.io/selenium-exercises/check_boxes.html
${comment_text_element} =    css:#text
${radio_button_red_color} =    css:[name="red"]
${radio_button_blue_color} =    css:[name="blue"]
${browser} =    firefox
${sleep_time} =    2s

*** Test Cases ***
Check light color
    Click element    ${radio_button_red_color}
    Select checkbox    ${radio_button_blue_color}
    Element attribute value should be    css:#light    data-color    \#FF00FFggg

Element can be enabled
    Click element     css:[for="switch"]
    Element should be enabled    ${comment_text_element}


*** Keywords ***
Load page
    Open browser    ${page_url}    ${browser}
    Maximize browser window
    Wait until page contains element    ${comment_text_element}

Finish test
    Sleep     ${sleep_time}
    Close browser