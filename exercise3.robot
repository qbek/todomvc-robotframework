*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
User can select favorite radion station
    Open Browser   https://qbek.github.io/selenium-exercises/pl/radio_buttons.html     firefox
    Select Radio Button     radio-select    radiozet
    # sposob 1 - najgorszy
    # Click Element     css:#radiozet-details a
    # Title Should Be     Radio ZET Muzyka Online - Informacje, wiadomości, pogoda | Radio ZET

    # sposób 2 - ten test cos sprawdza, w koncu
    Element Attribute Value Should Be    css:#radiozet-details a    href    https://www.radiozet.pl/
    Element Should Be Visible   css:#radiozet-details a