*** Settings ***
Library   SeleniumLibrary


*** Test Cases ***
Color mixer
    Open Browser   https://qbek.github.io/selenium-exercises/pl/check_boxes.html   firefox

    # antywzorzec
    # Click Element    css:[name="red"]


    Select Checkbox    css:[name="red"] 
    Select Checkbox     css:[name="blue"]
    
    Element Attribute Value Should Be   css:#light    data-color    \#FF00FF

    Close Browser


Enabling text area
    Open Browser   https://qbek.github.io/selenium-exercises/pl/check_boxes.html   firefox
    Element Should Be Disabled   css:#text
    # Select Checkbox    css:#switch
    Click Element   css:.custom-control-label
    Element Should Be Enabled    css:#text

    Close Browser