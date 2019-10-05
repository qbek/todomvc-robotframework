*** Settings ***
Library  SeleniumLibrary

Resource  Objects/TodoInputField.robot

*** Keywords ***
Open TodoMVC
    Open Browser  http://todomvc.com/examples/angularjs/#/  firefox
    Wait for todo input field

Close TodoMVC
    Close Browser