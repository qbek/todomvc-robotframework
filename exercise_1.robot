*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Fill the form 
    Open Browser   https://qbek.github.io/selenium-exercises/pl/basic_form.html    firefox
    Input Text    css:#firstname     Jakub
    Input Text    css:#lastname      Szewc
    Input Text    css:#email    wp@wp.pl

    # anty pattern - dodatkowa ukryta asercja czy klikany element jest <button?
    # Click Button   css:.btn-success
    
    Click Element   css:.btn-success

    Element Text Should Be    css:#firstname-check     Jakub
    Element Text Should Be    css:#lastname-check    Szewc
    Element Attribute Value Should Be   css:.form-control-plaintext    value     wp@wp.pl

    Sleep    2s
    Close Browser


Checkboxes 1
    Open Browser     https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox

    Select Checkbox    css:[name="red"]
    Select Checkbox    css:[name="blue"]
   
    #anti pattern -> wymaga poczatkowego sprawdzenia czy wogole chcemy kliknac
    # Click Element    css:[name="red"]
    # Click Element    css:[name="blue"]

    Element Attribute Value Should Be    css:#light    data-color     \#FF00FF
    Close Browser

Checkboxes 2
    Open Browser   https://qbek.github.io/selenium-exercises/pl/check_boxes.html   firefox
    Element Should Be Disabled   css:#text
    # Select Checkbox    css:#switch
    Click Element    css:.custom-control-label
    Element Should Be Enabled    css:#text
    Close Browser

Radio select
    Open Browser   https://qbek.github.io/selenium-exercises/pl/radio_buttons.html     firefox 
    Select Radio Button     radio-select    radiozet
    # Click Element   css:[value="radiozet"]
    
    # antipattern - nie klikamy w linki -> to jest funkcjonalosc przeglądarki
    # Click Element     css:#radiozet-details a
    # Title Should Be     Radio ZET Muzyka Online \ - Informacje, wiadomości, pogoda

    # poprawne rozwiazanie zadania -> dodanie sprawdzenia czy link jest dobry i czy jest widoczny
    Element Should Be Visible     css:#radiozet-details a
    Element Attribute Value Should Be     css:#radiozet-details a     href     https://www.radiozet.pl/
    Close Browser