*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Radio station select
    Open browser     https://qbek.github.io/selenium-exercises/pl/radio_buttons.html    firefox
    Select radio button    radio-select     rmffm
    Element attribute value should be     css:#rmffm-details a    href    https://www.rmf.fm/
    Click element     css:#rmffm-details a


