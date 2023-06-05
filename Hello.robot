*** Settings ***
Library   SeleniumLibrary


*** Test Cases ***

Hello world
    Log  I'm Jakub  console=True
    Log  Hellow World.
    

Browser puppetter
    Open Browser   http://google.pl   chrome
    Sleep   5s
    Close Browser