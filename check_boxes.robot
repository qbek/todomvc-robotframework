*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Light color test
    Open browser    https://qbek.github.io/selenium-exercises/check_boxes.html    firefox
    Select checkbox    css:[name="red"]
    Select checkbox    css:[name="red"]
    Select checkbox    css:[name="blue"]
  #  Click element    css:[name="red"]
  #  Click element    css:[name="red"]
  #  Click element    css:[name="blue"]
    Element attribute value should be    css:#light    data-color    \#FF00FF
    Sleep     2s
    Close browser

Enabling comment text box
    Open browser    https://qbek.github.io/selenium-exercises/check_boxes.html    firefox
    Element Should Be Disabled   css:#text
    Click element    css:.custom-control-label
    Element should be enabled    css:#text
    Sleep     2s
    Close browser