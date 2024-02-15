*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
Hello world
    Log   Hello world!!!
    Log   I'm Jakub
  
Hello Browser
    Open Browser   https://google.com    firefox
    Sleep   5s
    Close Browser


