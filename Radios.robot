*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Select radio station
    Open browser     https://qbek.github.io/selenium-exercises/pl/radio_buttons.html     firefox
    Maximize browser window
    Select radio button    radio-select    rmffm
#    Click element       css:#rmffm-details a
#    Element Should Be Visible      css:#radiozet-details a
    Element attribute value should be      css:#radiozet-details a   href    https://www.rmf.fm/
#    Title Should Be     Radio RMF FM - Najlepsza Muzyka
    Close browser