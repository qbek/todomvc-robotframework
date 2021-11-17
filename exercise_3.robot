*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
User can open radio station page
    Open browser     https://qbek.github.io/selenium-exercises/pl/radio_buttons.html    firefox
    Select radio button     radio-select     rmffm

    # podejście pierwsze: kliknięcie i sprawdzenie tytułu otwartej strony
    #####################################################################
#    Click element     css:#rmffm-details a
#    Title should be     RMF-FM cośtam cośtam
    # ale nie ma sensu uzależniać sie od zew. infrastruktury

    # podejście drugie: sprawdzenie czy sam link jest poprawny
    ##########################################################
#    Element attribute value should be     css:#rmffm-details a     href     https://www.rmf.fm/

    # podejście trzecie: sprawdzenie czy element z odpowiednim atrybutem istnieje na stronie
    ########################################################################################
    Element Should Be Visible      css:a[href="https://www.rmf.fm"]