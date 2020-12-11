*** Settings ***
Resource   resources/UserActions.robot
Resource   data/${ENV}_env.robot
Test Teardown    Close Browser


*** Test Cases ***
User can create a todo
    User opens TodoMVC app
    User creates a new todo
    User checks if todo is created

User can create a few todos
    User opens TodoMVC app
    User creates a few todos
    User checks if all todos are created
