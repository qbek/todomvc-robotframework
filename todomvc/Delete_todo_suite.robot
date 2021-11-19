*** Settings ***
Test Teardown   Close browser
Resource    resources/User_actions.robot
Resource    data/env_${ENV}.robot
Resource    data/td_${TD}.robot



*** Test Cases ***
User can delete a todo
    User opens TodoMVC app
    User adds a new todo
    User deletes the todo
    User checks if todo is deleted

User can delete THE ONE
    User opens TodoMVC app
    User adds a few todos
    User adds THE ONE
    User adds a few todos
    User deletes THE ONE
