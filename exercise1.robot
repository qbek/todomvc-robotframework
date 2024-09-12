*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can enter his details
    Open Browser   https://qbek.github.io/selenium-exercises/pl/basic_form.html   firefox
    Input Text   css:#firstname    Kuba
    Input Text   css:#lastname    Szewczyk
    Input Text   css:#email    wp@wp.pl
    
    # antywrzozec - przed kliknieciem sprawdza czy to jest <button>
    # Click Button   css:.btn-success
    Click Element   css:.btn-success
  
    Element Text Should Be   css:#firstname-check    Kuba
    Element Text Should Be   css:#lastname-check    Szewczyk
    Element Attribute Value Should Be   css:.form-control-plaintext    value    wp@wp.pl

    Close Browser


