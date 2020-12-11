*** Settings ***
Resource   resources/UserActions.robot
Resource   data/${ENV}_env.robot
Test Teardown    Close Browser

*** Test Cases ***
User can mark a todo as completed
    User opens TodoMVC app
    User creates a new todo
    User completes the todo
    User checks if todo is marked as completed

Active filter not shows completed todos
    User opens TodoMVC app
    User creates a new todo
    User completes the todo
    User checks if completed todo is NOT on 'Active' tab

Completed filter show completed todos
    User opens TodoMVC app
    User creates a new todo
    User completes the todo
    User checks if completed todo is on 'Completed' tab


User can complete THE ONE
    User opens TodoMVC app
    User creates a few todos
    User creates THE ONE
    User creates a few todos
    User completes THE ONE
    User checks if THE ONE is completed
