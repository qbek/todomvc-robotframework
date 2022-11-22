*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
User can open favorite radio station page
    Open browser    https://qbek.github.io/selenium-exercises/pl/radio_buttons.html    firefox
    Select radio button    radio-select    rmf
    # Opcja 1 - niezalecana - podązanie za linkiem
    # Click element    css:#rmffm-details a
    # Title should be    RMF-FM cośtam cośtam
    # Opcja 2 - sprawdzanie poprawnosci linka - uwaga!!! mozna miec false positive
    # Element Attribute Value Should Be    css:#rmffm-details a    href    https://www.rmf.fm/
    # Opcja 3 - sprawdzanie poprawnosci linka i widocznosci za jendym zamachem
    Element Should Be Visible    css:[href="https://www.rmf.fm"]
    Close Browser
