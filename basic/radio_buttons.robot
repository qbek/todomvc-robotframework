*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Check light color
    Open Browser    https://qbek.github.io/selenium-exercises/pl/radio_buttons.html   firefox
    Maximize Browser Window

    Select Radio Button    radio-select    rmffm
    Element Attribute Value Should Be    css:#rmffm-details a    href    https://www.rmf.fm/

    # Click Element    css:#rmffm-details a
    # Title Should Be    Radio RMF FM - Najlepsza Muzyka

    Close Browser
