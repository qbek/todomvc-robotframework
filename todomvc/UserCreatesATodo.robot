*** Settings ***
Library    Dialogs
Resource   resources/UserActions.robot
Test Teardown     Close browser


*** Test Cases ***
User can create a todo
    User opens TodoMVC application
    User creates a new todo
    User checks if created todo is on the list

User can check count of todos
    User opens TodoMVC application
    User creates a few todo
    User checks if todo counter shows correct value

#Semi auto test tryout
#    User opens TodoMVC application
#    Execute manual step     Please create a few todos
#    ${value} =    Get Value From User     How many todos have you created
#    User checks if todo counter shows value    ${value}
