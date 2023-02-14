*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
User can select favorite radion station
    Open Browser   https://qbek.github.io/selenium-exercises/pl/radio_buttons.html     firefox
    Select Radio Button     radio-select    radiozet
    # sposob 1
    # Click Element     css:#radiozet-details a
    # Title Should Be     RADIO
    # sposob 2 (uwaga na false positive - potrzeba tez sprawdzic czy element jest widoczny)
    # Element Attribute Value Should Be    css:#radiozet-details a   href   https://www.radiozet.pl/
    # Element Should Be Visible    css:#radiozet-details a
    # sposob 3
    Element Should Be Visible     css:a[href="https://www.radiozet.pl"]
    Close Browser
  