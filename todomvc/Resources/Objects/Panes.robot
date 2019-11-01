*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${panes} =    css:.filters
${active} =   ${panes} a[href="#/active"]
${completed} =   ${panes} a[href="#/completed"]


*** Keywords ***
Switch to Active
    Click Element   ${active}
    Capture Page Screenshot

Switch to Completed
    Click Element   ${completed}
    Capture Page Screenshot
