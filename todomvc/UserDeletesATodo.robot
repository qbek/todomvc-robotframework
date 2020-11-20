*** Settings ***
Resource   resources/UserActions.robot
Test Teardown     Close browser


*** Test Cases ***
User can delete a todo
    User opens TodoMVC application
    User creates a new todo
    User deletes a todo
    User checks if todo is NOT on All tab

User can detele THE ONE!
    User opens TodoMVC application
    User creates a few todo
    User creates THE ONE!
    User creates a few todo
    User deletes THE ONE!
    User checks if THE ONE! is not on the list