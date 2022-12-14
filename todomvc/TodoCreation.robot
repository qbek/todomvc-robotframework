*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
User can create a new todo
    Open Browser    https://todomvc.com/examples/jquery/#/all    firefox
    Wait Until Element Is Visible    css:.new-todo
    Input Text    css:.new-todo    Nowe zadanie
    Press Keys    css:.new-todo    RETURN
    Element Text Should Be    css:.todo-list    Nowe zadanie
    Close Browser
