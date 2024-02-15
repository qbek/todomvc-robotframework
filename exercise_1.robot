*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Exercise 1
    Open Browser   https://qbek.github.io/selenium-exercises/pl/basic_form.html   firefox

    # Podejscie klasyczne: szukam kazdego elementu z osobna po konkretnym selektorze 
    # Input Text   css:#firstname   Jakub
    # Input Text   css:#lastname    Szewczyk
    # Input Text   css:#email     wp@wp.pl
    
    # Alternatywne podejscie z nawigacja z uzyciem TAB'a
    Input Text    css:#firstname    Jakub jjhj
    Press Keys    css:#firstname    TAB
    Input Text    css:input:focus    Szewczyk
    Press Keys    css:input:focus    TAB
    Input Text    css:input:focus    wp@wp.pl

    Click Element   css:.btn-success
   
    Element Text Should Be   css:#firstname-check    Jakub
    Element Text Should Be    css:#lastname-check    Szewczyk
    # Element Text Should Be    css:.form-control-plaintext    wp@wp.pl

    Element Attribute Value Should Be    css:.form-control-plaintext    value    wp@wp.pl
    Close Browser

Exercise 2
    Open Browser    https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox

    Select Checkbox   css:[name="red"]
    Select Checkbox   css:[name="blue"]

    Element Attribute Value Should Be    css:#light    data-color    \#FF00FF


Exercise 2b
    Open Browser    https://qbek.github.io/selenium-exercises/pl/check_boxes.html    firefox

    Element Should Be Disabled    css:#text
    # Select Checkbox    css:#switch
    Click Element   css:.custom-control-label
    Element Should Be Enabled    css:#text

Exercise 3
    Open Browser    https://qbek.github.io/selenium-exercises/pl/radio_buttons.html    firefox
    Select Radio Button    radio-select    rmffm
    Element Attribute Value Should Be    css:#radiozet-details a    href    https://www.radiozet.pl/
    Element Should Be Visible    css:#radiozet-details a
    Close Browser
