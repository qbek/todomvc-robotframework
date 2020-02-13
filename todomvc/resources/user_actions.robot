*** Settings ***
Library    SeleniumLibrary
Resource   pageobjects/create_todo_input.robot
Resource   pageobjects/todo_tabs.robot
Resource   pageobjects/todos_list.robot


*** Variables ***
${BROWSER} =    firefox


*** Keywords ***
user opens todoMVC app
    Open browser    http://todomvc.com/examples/angularjs/#/    ${BROWSER}
    Maximize browser window
    Is create todo input displayed

user creates a new todo
    Add todo

user can see his todo on the list
    Todo is on the list

user completes a todo
    Complete a todo

user sees todo marked as completed
    Todo is displayed as completed

completed todo is not on the Active list
    Switch to active todos tab
    Todo is not on the list

completed todo is on Completed list
    Switch to completed todos tab
    Todo is on the list