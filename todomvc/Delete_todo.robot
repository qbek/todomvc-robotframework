*** Settings ***
Resource    steps/User_steps.robot
Resource    data/test_data.robot
Test Teardown    User colses TodoMVC app


*** Test Cases ***
User can delete a todo
    Set todo name for test    Zadanie do skasowanie
    User opens TodoMVC app
    User creates a new todo
    User deletes created todo
    User checks todo is deleted


