*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
User can create a new todo
    Open Browser    https://todomvc.com/examples/jquery/dist/#/all    firefox

    Input Text    css:#new-todo    To jest moje pierwsze zadanie
    Press Keys     css:#new-todo    RETURN

    Element Text Should Be     css:#todo-list label    To jest moje pierwsze zadanie
    Close Browser