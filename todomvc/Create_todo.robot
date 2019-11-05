*** Settings ***
Resource   Resources/User_actions.robot
Test Teardown    Close Browser

*** Variables ***
${APP_URL} =   http://todomvc.com/examples/angularjs/#/
${BROWSER} =   firefox



*** Test Cases ***
User can add a new todo
    User opens ToDo application
    User adds a new todo
    A new todo is created

User can add few todos
    User opens ToDo application
    User adds few todos
    Todo counter shows correct number of todos

