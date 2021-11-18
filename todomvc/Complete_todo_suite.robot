*** Settings ***
Library    SeleniumLibrary
Test Teardown   Close browser
Resource    resources/User_actions.robot
Resource    data/env_jquery.robot


*** Test Cases ***
User can complete a todo
    User opens TodoMVC app
    User adds a new todo
    User completes the todo
    User checks if todo is marked as completed

User can filter only active todos
    User opens TodoMVC app
    User adds a new todo
    User completes the todo
    User checks if completed todo is not on Active tab

User can filter only completed todos
    User opens TodoMVC app
    User adds a new todo
    User completes the todo
    User checks if completed todo is on Completed tab