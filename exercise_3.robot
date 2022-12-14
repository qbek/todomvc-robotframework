*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
User can open radio page
    Open Browser    https://qbek.github.io/selenium-exercises/pl/radio_buttons.html    firefox
    Select Radio Button    radio-select    radiozet
    # Pierwsze podejsce z otwieraniem strony trzeciej
    # Click Element    css:#radiozet-details a
    # Title Should Be    Radio ZET
    # Drugie podejscie ze sprawdzaniem widocznosci i poprawnosci atrybutu href
    # Element Should Be Visible    css:#radiozet-details a
    # Element Attribute Value Should Be    css:#radiozet-details a    href    https://www.radiozet.pl/
    # Trzecie - sprawdzenie widocznosci i linka za jendym zamachem
    Element Should Be Visible    css:a[href="https://www.radiozet.pl"]
    Close Browser
